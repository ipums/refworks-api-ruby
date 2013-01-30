class ImportfilterResponse < Response
  attr_reader :totalFilters, :importfilters

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      @totalFilters = "0"
      return
    end

    @totalFilters = self.parsed_response["refworks"]["RWResult"]["ImportFilterResult"]["totalFilters"]

    # e.g. case of no favorites
    if @totalFilters == "0"
      return
    end

    # If results returned, process the importfilters and metadata
    filter_list = self.parsed_response["refworks"]["RWResult"]["ImportFilterResult"]["ImportFilter"]

    # here we parse out authors into an array of actual Importfilter objects (even if only 1 ref returned)
    @importfilters = Array.new

    # The RefWorks API can return an array or a single element depending on how many importfilters were returned.
    if filter_list.class == Array
      filter_list.each do |rawfilter|
        @importfilters << Importfilter.new(rawfilter)
      end
    else
      # here, "filter_list" is just a hash representing a single author
      # in other words, only one importfilter was returned
      @importfilters << Importfilter.new(filter_list)
    end
  end
end