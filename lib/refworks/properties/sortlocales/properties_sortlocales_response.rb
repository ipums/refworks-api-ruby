class PropertiesSortlocalesResponse < PropertiesResponse
  attr_reader :sortlocales

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      @total = "0"
      return
    end

    # If results returned, process the locales and metadata

    locs = self.parsed_response["refworks"]["RWResult"]["PropertiesResult"]["sortLocale"]

    @sortlocales = Array.new
    locs.each do |loc|
      @sortlocales << Sortlocale.new(loc)
    end
  end
end