# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class AuthenticationNewtempusersessResponse < AuthenticationResponse

  attr_reader :tempsess

  def initialize(raw_response)
    super(raw_response)
    @tempsess = self.parsed_response["refworks"]["RWResult"]["CallInfo"]["sess"]
  end
end