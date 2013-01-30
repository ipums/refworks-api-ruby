class PropertiesFieldlabelsResponse < PropertiesResponse
  attr_reader :total, :periodicals

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      @total = "0"
      return
    end

    # If results returned, process the periodicals and metadata

    @total = self.parsed_response["refworks"]["RWResult"]["RWPeriodical"]["total"]

    per_list = self.parsed_response["refworks"]["RWResult"]["RWPeriodical"]["Periodical"]

    # here we parse out periodicals into an array of actual Periodical objects (even if only 1 ref returned)
    @periodicals = Array.new

    # The RefWorks API can return an array or a single element depending on how many periodicals were returned.
    if per_list.class == Array
      per_list.each do |rawperiodical|
        @periodicals << Periodical.new(rawperiodical)
      end
    else
      # here, "periodical_list" is just a hash representing a single periodical
      # in other words, only one periodical was returned
      @periodicals << Periodical.new(per_list)
    end
  end
end