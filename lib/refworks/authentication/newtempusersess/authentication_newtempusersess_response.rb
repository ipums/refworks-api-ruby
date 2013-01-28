class AuthenticationNewtempusersessResponse < AuthenticationResponse

  attr_reader :tempsess

  def initialize(raw_response)
    super(raw_response)
    @tempsess = self.parsed_response["refworks"]["RWResult"]["CallInfo"]["sess"]
  end
end