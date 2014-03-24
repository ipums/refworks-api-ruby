$LOAD_PATH << File.expand_path(File.dirname(File.realpath(__FILE__)) + '/..')
require 'rubygems'
require 'bundler/setup'

# This will recursively load all child classes - done this way
# because there are many, many child classes, and makes it easier
# to keep adding support for more parts of the refworks API
require 'httparty'
require 'cgi'
require 'pp'
require 'require_all'
require_rel 'refworks'

# This is the main entry class to the API.  It handles session attainment, assembles and
# issues requests, and routes responses to the appropriate response object.
# @api public
class Refworks
  include HTTParty

  attr_reader :api_url, :access_key, :secret_key, :login_name, :password, :group_code, :id, :sess
  attr_writer :sess

  # Create a new Refworks client instance.
  # @example
  #   rwc = Refworks.new({:access_key => 'YOUR_ACCESS_KEY_HERE',
  #                       :secret_key => 'YOUR_SECRET_KEY_HERE',
  #                       :id         => '',  # Either id -or- group_code is needed
  #                       :group_code => 'YOUR_GROUP_CODE_HERE',
  #                       :login_name => 'YOUR_LOGIN_NAME_HERE',
  #                       :password   => 'YOUR_PASSWORD_HERE',
  #                       :api_url    => 'https://www.refworks.com/api2/',
  #                       :httparty_debug => 0, # or a true value to turn on httparty debug output
  #                       :httparty_timeout => 300, # may need to set higher if your database is very large
  #                      })
  # @param [Hash] params The configuration settings for this instance of the Refworks API client.  See example above
  #   for list of possible/required keys.
  def initialize(params)

    # configure HTTParty using its debug_output and default_timeout methods if user passed in values for these
    # (otherwise it uses HTTParty defaults)
    if params[:httparty_debug]
      self.class.debug_output $stderr
    end
    if params[:httparty_timeout]
      self.class.default_timeout(params[:httparty_timeout])
    end

    # populate the attributes
    @api_url = params[:api_url]
    @access_key = params[:access_key]
    @secret_key = params[:secret_key]
    @login_name = params[:login_name]
    @password = params[:password]
    @group_code = params[:group_code]
    @id = params[:id]

    # probably should check here that I have the minimal set of required attributes to continue

    # Can't do much without a session, so get one now if one wasn't passed in
    #if params[:sess]
    #  @sess = params[:sess]
    #else
      # May need to refactor this - there are parts of the API that don't strictly need a session
      if (@group_code)
        response = request('authentication', 'newsess',
                           {
                              :login_name => @login_name,
                              :group_code => @group_code,
                              :password => @password,
                           }
        )
      else
        response = request('authentication', 'newsess',
                           {
                               :login_name => @login_name,
                               :id => @id,
                               :password => @password,
                           }
        )
      end

      # Grab the session string.
      @sess = response.sess
  #  end
  #
    # Need some error checking here
  end

  private

  # Returns appropriate request class name constant given class and method strings
  #
  # @param [String] class_name The class name being called in the Refworks API
  # @param [String] method_name The method name being called in the Refworks API
  # @return [Object] The class constant for the request class
  def resolve_request_class(class_name, method_name)
    Object.const_get([class_name, method_name, 'Request'].collect(&:capitalize).join)
  end

  # Produce appropriate response class name constant given class and method strings
  #
  # @param [String] class_name The class name being called in the Refworks API
  # @param [String] method_name The method name being called in the Refworks API
  # @return [Object] The class constant for the response class
  def resolve_response_class(class_name, method_name)
    Object.const_get([class_name, method_name, 'Response'].collect(&:capitalize).join)
  end

  protected

  # Combines the request, signature and session query parameters, CGI-escaping
  # them in the process, and returns a query string.
  #
  # @param [Hash] request_params Request-specific parameters, including the class, the method, and any method params
  # @param [Hash] signature_params The signature parameters for this call
  # @return [String] The fully-formed and escaped query string
  def generate_query_params(request_params, signature_params)

    # create a CGI-escaped query string fragment out of all of the request-specific parameters
    request_param_string = request_params.collect { |key, value|
      # sometimes a method parameter is an array - like multiple id's for the retrieve->byid id parameter
      if value.is_a?(Array)
        value.collect { |x|
          x = CGI.escape(x.to_s)
          "#{key}=#{x}"}.join("&")
      # but most method parameters are scalar
      else
        value = CGI.escape(value.to_s)
        "#{key}=#{value}"
      end
    }.join("&")

    # create a CGI-escaped query string fragment out of the signature pieces
    signature_param_string = signature_params.collect { |key, value|
      value = CGI.escape(value.to_s)
      "#{key}=#{value}"}.join("&")

    # create a CGI-escaped query string fragment out of the session
    # Session string handling needs to be more elegant.  Too hard coded/inflexible
    if sess
      session_param_string = "sess=" + CGI.escape(sess)
    else
      session_param_string = ''
    end

    # combine all and return
    request_param_string + '&' + signature_param_string + '&' + session_param_string
  end

  public

  # Issue a request to the Refworks API and use the response to construct a Response object.  This method is the
  # primary way that users interact with the Refworks API.
  # @example
  #   response = rwc.request('retrieve', 'quick', {:search => "Jones"})
  # @param [String] class_name The class name being called in the Refworks API
  # @param [String] method_name The method name being called in the Refworks API
  # @param [Hash] method_params A Hash containing a method-specific set of parameters.  See the documentation for each
  #    method for more info.  This can be omitted in the case of a method that does not require any parameters.
  # @return [Object] A child object of the Response object (specific to the particular API call being made)
  def request(class_name, method_name, method_params = {})

    # Resolve the request class and use it to retrieve the request-specific query parameters
    request_class = resolve_request_class(class_name, method_name)
    request_info = request_class.generate_request_info(method_params)

    # Generate a signature for this call
    signature_params = request_class.generate_signature(class_name, access_key, secret_key)

    # Put it all together to complete the query string
    query_params = self.generate_query_params(request_info[:params], signature_params)

    # Some parts of the API use a different URL than the base URL, so we check for that here and assemble
    # the entire request URL
    url = (method_params[:base_url] || api_url) + "?#{query_params}"

    # make the request
    if request_class.http_request_verb == 'POST'
      raw_response = self.class.post(url, :body => request_info[:body], :headers => request_info[:headers])
    else
      raw_response = self.class.get(url)
    end

    # Resolve, instantiate and return the response class
    response_class = resolve_response_class(class_name, method_name)
    response_class.new(raw_response)
  end
end
