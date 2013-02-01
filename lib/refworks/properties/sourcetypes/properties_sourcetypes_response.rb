class PropertiesSourcetypesResponse < PropertiesResponse
  attr_reader :sourcetypes

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      @total = "0"
      return
    end

    # If results returned, process the sourcetypes and metadata

    srcs = self.parsed_response["refworks"]["RWResult"]["PropertiesResult"]["sourcetype"]

    @sourcetypes = Array.new
    srcs.each do |src|
      @sourcetypes << Sourcetype.new(src)
    end
  end
end