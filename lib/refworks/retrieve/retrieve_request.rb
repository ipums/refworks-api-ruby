class RetrieveRequest < Request
  def self.call_class
    "retrieve"
  end

  def self.generate_class_params(params)
    # handle params common to all Retrieve calls
    class_name = call_class()

    # query parameters common to all Retrieve calls
    {
      :class => class_name,
      :pgsize => params[:pgsize] || 1000,
      :pgnum => params[:pgnum] || 1,
      :search => params[:search],
      :format => params[:format] || 'html',
      :sort => params[:sort], # no default set; according to API, default depends on method called
      :style => 0,  # no alternate styles currently supported; passed-in param will be ignored
      :language => 'en', # only differs if a style is set, which is not possible currently; passed-in param ignored
      :biblist => 'false' # only differs if a style is set, which is not possible currently; passed-in param ignored
    }
  end
end