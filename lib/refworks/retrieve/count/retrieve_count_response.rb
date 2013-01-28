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