require 'rubygems'  
require 'httparty'
require 'cgi'
require 'pp'

# This will recursively load all child classes - done this way
# because there are many, many child classes, and makes it easier
# to keep adding support for more parts of the refworks API
require 'require_all'
require_rel 'refworks'

class Refworks
  include HTTParty

  attr_reader :api_url, :access_key, :secret_key, :login_name, :password, :group_code, :sess

  def initialize(params)
    if (params[:httparty_debug])
      self.class.debug_output $stderr
    end
    @api_url = params[:api_url]
    @access_key = params[:access_key]
    @secret_key = params[:secret_key]
    @login_name = params[:login_name]
    @password = params[:password]
    @group_code = params[:group_code]

    # Can't do much without a session, so get one now
    response = request(:class_name => 'authentication',
                       :method_name => 'newsess',
                       :method_params => {
                          :login_name => login_name,
                          :group_code => group_code,
                          :password => password,
                       }
    )
    @sess = response.sess
  end

  def resolve_request_class(params)
    # produce appropriate camelCased class name, and convert to a constant so we can use it as a class
    Object.const_get([params[:class_name], params[:method_name], 'Request'].collect(&:capitalize).join)
  end

  def resolve_response_class(params)
    # produce appropriate camelCased class name, and convert to a constant so we can use it as a class
    Object.const_get([params[:class_name], params[:method_name], 'Response'].collect(&:capitalize).join)
  end

  def generate_query_params(request_params, signature_params)

    request_param_string = request_params.collect { |key, value|
      value = CGI.escape(value.to_s)
      "#{key}=#{value}"}.join("&")

    signature_param_string = signature_params.collect { |key, value|
      value = CGI.escape(value.to_s)
      "#{key}=#{value}"}.join("&")

    # Session string handling needs to be more elegant.  Too hard coded/inflexible
    if (!sess)
      session_param_string = ''
    else
      session_param_string = "sess=" + CGI.escape(sess)
    end

    request_param_string + '&' + signature_param_string + '&' + session_param_string
  end

  def request(params)
    request_class = resolve_request_class(params)
    request_info = request_class.generate_request_info(params[:method_params])

    signature_params = request_class.generate_signature(params[:class_name], access_key, secret_key)
    query_params = self.generate_query_params(request_info[:params], signature_params)

    url = api_url + "?#{query_params}"

    if (request_class.http_request_verb == 'POST')
      raw_response = self.class.post(url, :body => request_info[:body], :headers => request_info[:headers])
    else
      raw_response = self.class.get(url)
    end

    response_class = resolve_response_class(params)
    response = response_class.new(raw_response)
  end
end
