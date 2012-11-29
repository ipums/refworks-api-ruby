require 'rubygems'  
require 'HTTParty'
require 'cgi'
require 'pp'
require_relative('./Request.rb')
require_relative('./Authentication/authentication_request.rb')
require_relative('./Authentication/newsess/newsess_request.rb')

class RefWorksClient
  include HTTParty
  debug_output $stderr

  attr_reader :apiURL, :accessKey, :secretKey, :loginName, :password, :groupCode

  def initialize(params)
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

  def generateQueryParams(requestParams, signatureParams, sessionParams)

    requestParamString = requestParams.collect { |key, value| "#{key}=#{value}"}.join("&")
    signatureParamString = signatureParams.collect { |key, value| "#{key}=#{value}"}.join("&")
    if (!sessionParams)
      sessionParamString = ''
    else
      sessionParamString = sessionParams.collect { |key, value| "#{key}=#{value}"}.join("&")
    end

    requestParamString + '&' + signatureParamString + '&' + sessionParamString
  end

  def request(params)
    requestClass = resolveRequestClass(params)
    requestInfo = requestClass.generateRequestInfo(params[:methodParams])

    signatureParams = requestClass.generateSignature(params[:className],self.accessKey,self.secretKey)

    queryParams = self.generateQueryParams(requestInfo[:params], signatureParams, nil)

    url = self.apiURL + "?#{queryParams}"

    if (requestClass.httpRequestVerb == 'POST')
      self.class.debug_output $stderr
      response = self.class.post(url, :body => requestInfo[:body], :headers => requestInfo[:headers])
      pp response.body
    else
      response = get(url)
    end
  end
end
