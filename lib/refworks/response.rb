# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby


class Response
  attr_reader :body, :parsed_response, :result_code, :result_msg, :process_time, :result_msg_code

  def initialize(raw_response)
    # The RefWorks API emits invalid XML.  Specifically, when the session is invalid, the ResultMsg field
    # which comes back contains some illegal raw characters.  This is the only set of transformations I
    # could find which completely eliminate the junk characters.

    # Trying to work around the malformed response bug
    p raw_response.body
    # Replace non UTF-8 chars with the empty string
    raw_response.body.encode!('UTF-8', 'binary', :invalid => :replace, :undef => :replace, :replace => '')
    # Remove characters which are not allowed to appear in XML messages
    raw_response.body.gsub!(/[\u0001-\u0019]/,'')
    p raw_response.body

    @body = raw_response.body
    @parsed_response = raw_response.parsed_response
    @result_code = parsed_response["refworks"]["RWResult"]["result"]
    @process_time = parsed_response["refworks"]["RWResult"]["processTime"]
    @result_msg = parsed_response["refworks"]["RWResult"]["resultMsg"]
    @result_msg_code = parsed_response["refworks"]["RWResult"]["resultMsgCode"]
  end
end