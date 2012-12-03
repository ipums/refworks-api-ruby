class AuthenticationNewsessResponse < AuthenticationResponse

  attr_reader :sess

  def initialize(params, raw_response)
    super(params, raw_response)
    @sess = self.parsed_response["refworks"]["RWResult"]["CallInfo"]["sess"]
  end

end