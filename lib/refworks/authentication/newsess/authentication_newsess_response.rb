class AuthenticationNewsessResponse < AuthenticationResponse

  attr_reader :sess

  def initialize(raw_response)
    super(raw_response)
    @sess = self.parsed_response["refworks"]["RWResult"]["CallInfo"]["sess"]
  end

end