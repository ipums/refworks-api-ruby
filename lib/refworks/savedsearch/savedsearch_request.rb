class SavedsearchRequest < Request
  def self.call_class
    "savedsearch"
  end

  def self.generate_class_params(params)
    # handle params common to all Savedsearch calls
    class_name = call_class()

    # query parameters common to all Savedsearch calls
    {
        :class => class_name,
    }
  end
end