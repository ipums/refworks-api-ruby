
class Response
  attr_reader :body, :parsed_response

  def initialize(raw_response)
    @body = raw_response.body
    @parsed_response = raw_response.parsed_response
  end
end