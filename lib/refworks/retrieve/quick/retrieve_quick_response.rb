class RetrieveQuickResponse < RetrieveResponse
  attr_reader :references

  def initialize(params, raw_response)
    super(params, raw_response)
    refs = self.parsed_response["refworks"]["RWResult"]["RetrieveResult"]["reference"]
    # here we parse out references into actual Reference objects
    @references = Array.new
    refs.each do |ref|
      @references << Reference.new(ref)
    end
  end
end