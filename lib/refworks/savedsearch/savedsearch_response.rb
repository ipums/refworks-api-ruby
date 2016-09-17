# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class SavedsearchResponse < Response
  attr_reader :savedsearches

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      @total = "0"
      return
    end

    # If results returned, process the savedsearches and metadata

    srchs = self.parsed_response["refworks"]["RWResult"]["AdvancedSearchStrategy"]

    @savedsearches = Array.new
    if srchs.class == Array
     srchs.each do |srch|
        @savedsearches << Savedsearch.new(srch)
      end
    else
       @savedsearches << Savedsearch.new(srchs)
    end
  end
end