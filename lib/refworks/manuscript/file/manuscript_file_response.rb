# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class ManuscriptFileResponse < ManuscriptResponse
  attr_reader :body, :parsed_response, :result_code, :result_msg, :process_time

  def initialize(raw_response)

    @result_code = raw_response.code
    @body = raw_response.body
    @parsed_response = nil

    if @result_code != 200
      @result_code = raw_response.code
      @result_msg = raw_response.msg
    else
      @parsed_response = nil
      @result_msg = "File retrieved and stored in body attribute.  Parsed response not applicable for file retrievals."
    end
  end
end