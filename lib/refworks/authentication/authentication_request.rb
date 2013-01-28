class AuthenticationRequest < Request

  def self.call_class
    'authentication'
  end

  def self.generate_class_params(params)
    # handle params common to all Retrieve calls
    class_name = call_class()

    # query parameters common to all Retrieve calls
    {
        :class => class_name,
    }
  end

end