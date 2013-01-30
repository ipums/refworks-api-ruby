class DescriptorsResponse < Response
  attr_reader :total, :descriptors

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      @total = "0"
      return
    end

    # If results returned, process the descriptors and metadata

    @total = self.parsed_response["refworks"]["RWResult"]["RWDescriptor"]["total"]

    desc_list = self.parsed_response["refworks"]["RWResult"]["RWDescriptor"]["Descriptor"]

    # here we parse out into an array of actual Descriptor objects (even if only 1 ref returned)
    @descriptors = Array.new

    # The RefWorks API can return an array or a single element depending on how many descriptors were returned.
    if desc_list.class == Array
      desc_list.each do |rawdesc|
        @descriptors << Descriptor.new(rawdesc)
      end
    else
      # here, "descriptor_list" is just a hash representing a single descriptor
      # in other words, only one was returned
      @descriptors << Descriptor.new(desc_list)
    end
  end
end