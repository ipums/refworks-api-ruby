# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

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