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

  attr_reader :api_url, :access_key, :secret_key, :login_name, :password, :group_code

  def initialize(params)
    self.class.debug_output $stderr
    @api_url = params[:api_url]
    @access_key = params[:access_key]
    @secret_key = params[:secret_key]
    @login_name = params[:login_name]
    @password = params[:password]
    @group_code = params[:group_code]
  end

  def resolve_request_class(params)
    class_name = params[:class_name]
    method_name = params[:method_name]

    Object.const_get([class_name, method_name, 'Request'].collect(&:capitalize).join)
  end

  def generate_query_params(request_params, signature_params, session_params=nil)

    request_param_string = request_params.collect { |key, value| "#{key}=#{value}"}.join("&")
    signature_param_string = signature_params.collect { |key, value| "#{key}=#{value}"}.join("&")
    if (!session_params)
      session_param_string = ''
    else
      session_param_string = session_params.collect { |key, value| "#{key}=#{value}"}.join("&")
    end

    request_param_string + '&' + signature_param_string + '&' + session_param_string
  end

  def request(params)
    request_class = resolve_request_class(params)
    request_info = request_class.generate_request_info(params[:method_params])

    signature_params = request_class.generate_signature(params[:class_name],self.access_key,self.secret_key)

    query_params = self.generate_query_params(request_info[:params], signature_params)

    url = self.api_url + "?#{query_params}"

    if (request_class.http_request_verb == 'POST')
      response = self.class.post(url, :body => request_info[:body], :headers => request_info[:headers])
      pp response.body
    else
      response = get(url)
    end
  end
end
