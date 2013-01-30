class DescriptorsRequest < Request
  def self.call_class
    "descriptors"
  end

  def self.generate_class_params(params)
    # handle params common to all Descriptors calls
    class_name = call_class()

    # query parameters common to all Descriptors calls
    {
        :class => class_name,
        :pgsize => params[:pgsize] || 50,
        :pgnum => params[:pgnum] || 1,
    }
  end
end