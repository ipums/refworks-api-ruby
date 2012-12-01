class AuthenticationNewsessResponse

  attr_reader :body

  def initialize(params, raw_response)
    @body = raw_response.body
  end
end