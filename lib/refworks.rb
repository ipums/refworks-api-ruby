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

  attr_reader :apiURL, :accessKey, :secretKey, :loginName, :password, :groupCode

  def initialize(params)
    self.class.debug_output $stderr
    @apiURL = params[:apiURL]
    @accessKey = params[:accessKey]
    @secretKey = params[:secretKey]
    @loginName = params[:loginName]
    @password = params[:password]
    @groupCode = params[:groupCode]
  end

  def resolveRequestClass(params)
    className = params[:className]
    methodName = params[:methodName]

    Object.const_get(className + methodName + 'Request')
  end

  def generateQueryParams(requestParams, signatureParams, sessionParams=nil)

    request_param_string = requestParams.collect { |key, value| "#{key}=#{value}"}.join("&")
    signatureParamString = signatureParams.collect { |key, value| "#{key}=#{value}"}.join("&")
    if (!sessionParams)
      sessionParamString = ''
    else
      sessionParamString = sessionParams.collect { |key, value| "#{key}=#{value}"}.join("&")
    end

    request_param_string + '&' + signatureParamString + '&' + sessionParamString
  end

  def request(params)
    requestClass = resolveRequestClass(params)
    requestInfo = requestClass.generateRequestInfo(params[:methodParams])

    signatureParams = requestClass.generateSignature(params[:className],self.accessKey,self.secretKey)

    queryParams = self.generateQueryParams(requestInfo[:params], signatureParams)

    url = self.apiURL + "?#{queryParams}"

    if (requestClass.httpRequestVerb == 'POST')
      response = self.class.post(url, :body => requestInfo[:body], :headers => requestInfo[:headers])
      pp response.body
    else
      response = get(url)
    end
  end
end
