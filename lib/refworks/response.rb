
class Response
  attr_reader :body, :parsed_response, :result_code, :result_msg, :process_time

  def initialize(raw_response)
    @body = raw_response.body
    @parsed_response = raw_response.parsed_response
    @result_code = parsed_response["refworks"]["RWResult"]["result"]
    @process_time = parsed_response["refworks"]["RWResult"]["processTime"]
    @result_msg = parsed_response["refworks"]["RWResult"]["resultMsg"]
  end
end