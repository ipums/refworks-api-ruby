# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class PropertiesTypelabelsResponse < PropertiesResponse
  attr_reader :typelabels

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      @total = "0"
      return
    end

    # If results returned, process the sourcetypes and metadata

    lbls = self.parsed_response["refworks"]["RWResult"]["PropertiesResult"]["reference"]

    @typelabels = Array.new
    lbls.each do |lbl|
      @typelabels << Typelabel.new(lbl)
    end
  end
end