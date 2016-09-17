# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class PropertiesOutputlanguageResponse < PropertiesResponse
  attr_reader :outputlanguages

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      @total = "0"
      return
    end

    # If results returned, process the languages and metadata

    langs = self.parsed_response["refworks"]["RWResult"]["PropertiesResult"]["outputLang"]

    @outputlanguages = Array.new
    langs.each do |lang|
      @outputlanguages << Outputlanguage.new(lang)
    end
  end
end