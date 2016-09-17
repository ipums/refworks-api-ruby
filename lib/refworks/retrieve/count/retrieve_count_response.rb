# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class RetrieveCountResponse < Response

  attr_reader :count

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      return
    end

    # If results returned, process the references and metadata

    @count = self.parsed_response["refworks"]["RWResult"]["RetrieveCount"]["count"]
  end

end