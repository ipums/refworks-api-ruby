class ImportfilterRequest < Request
  def self.call_class
    "importfilter"
  end

  def self.generate_class_params(params)
    # handle params common to all ImportFilters calls
    class_name = call_class()

    # query parameters common to all ImportFilters calls
    {
        :class => class_name,
        :includedb => params[:includedb] || 'false',
    }
  end
end