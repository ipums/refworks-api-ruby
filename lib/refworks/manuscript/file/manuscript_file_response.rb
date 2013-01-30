class ManuscriptFileResponse < ManuscriptResponse
  attr_reader :body, :parsed_response, :result_code, :result_msg, :process_time

  def initialize(raw_response)
    @body = raw_response.body
    @parsed_response = nil
    @result_code = 200
    @result_msg = "File retrieved.  Parsed response not applicable for file retrievals."
  end
end