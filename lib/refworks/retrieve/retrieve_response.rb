class RetrieveResponse < Response

  attr_reader :total_hits, :total_returned

  def initialize(raw_response)
    super(raw_response)
    @total_hits = self.parsed_response["refworks"]["RWResult"]["RetrieveResult"]["totalHits"]
    @total_returned = self.parsed_response["refworks"]["RWResult"]["RetrieveResult"]["totalReturned"]
  end
end