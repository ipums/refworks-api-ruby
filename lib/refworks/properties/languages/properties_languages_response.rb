class PropertiesLanguagesResponse < PropertiesResponse
  attr_reader :languages

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      @total = "0"
      return
    end

    # If results returned, process the languages and metadata

    langs = self.parsed_response["refworks"]["RWResult"]["PropertiesResult"]["lang"]

    @languages = Array.new
    langs.each do |lang|
      @languages << Language.new(lang)
    end
  end
end