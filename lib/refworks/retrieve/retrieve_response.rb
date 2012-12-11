class RetrieveResponse < Response

  attr_reader :total_hits, :total_returned, :references

  def initialize(raw_response)
    super(raw_response)
    if (result_code != "200")
      @total_hits = "0"
      @total_returned = "0"
      return
    end
    @total_hits = self.parsed_response["refworks"]["RWResult"]["RetrieveResult"]["totalHits"]
    @total_returned = self.parsed_response["refworks"]["RWResult"]["RetrieveResult"]["totalReturned"]

    refs = self.parsed_response["refworks"]["RWResult"]["RetrieveResult"]["reference"]
    # here we parse out references into actual Reference objects
    @references = Array.new

    # The RefWorks API can return an array or a single element depending on how many references were returned.
    if (refs.class == Array)
      refs.each do |ref|
        @references << Reference.new(ref)
      end
    else
      # here, "refs" is just a hash representing a single reference
      # in other words, only one reference was returned
      @references << Reference.new(refs)
    end
  end
end