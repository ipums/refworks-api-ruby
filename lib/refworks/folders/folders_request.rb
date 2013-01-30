class FoldersRequest < Request
  def self.call_class
    "folders"
  end

  def self.generate_class_params(params)
    # handle params common to all Folders calls
    class_name = call_class()

    # query parameters common to all Folders calls
    {
        :class => class_name,
        :pgsize => params[:pgsize] || 50,
        :pgnum => params[:pgnum] || 1,
    }
  end
end