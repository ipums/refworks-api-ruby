class PropertiesRequest < Request
  def self.call_class
    "properties"
  end

  def self.generate_class_params(params)
    # handle params common to all Properties calls
    class_name = call_class()

    # query parameters common to all Properties calls
    {
        :class => class_name,
    }
  end
end