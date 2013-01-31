class ManuscriptBaseurlResponse < ManuscriptResponse
  attr_reader :baseurl

  def initialize(raw_response)
    super(raw_response)

    if result_code != "200"
      return
    end

    @baseurl = self.parsed_response["refworks"]["RWResult"]["BaseURL"]
  end
end