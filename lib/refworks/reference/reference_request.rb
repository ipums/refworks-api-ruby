class ReferenceRequest < Request
  def self.call_class
    "reference"
  end

  def self.generate_class_params(params)
    # handle params common to all Reference calls
    class_name = call_class()

    # query parameters common to all Reference calls
    {
        :class => class_name,
    }
  end
end