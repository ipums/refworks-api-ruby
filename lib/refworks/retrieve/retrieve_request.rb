# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

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
      :pgsize => params[:pgsize] || 50,
      :pgnum => params[:pgnum] || 1,
      :format => params[:format] || 'html',
      :sort => params[:sort], # no default set; according to API, default depends on method called
      :style => 0,  # no alternate styles currently supported; passed-in param will be ignored
      :language => 'en', # only differs if a style is set, which is not possible currently; passed-in param ignored
      :biblist => 'false' # only differs if a style is set, which is not possible currently; passed-in param ignored
    }
  end
end