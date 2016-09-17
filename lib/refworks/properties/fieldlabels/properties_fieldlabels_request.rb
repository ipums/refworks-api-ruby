# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class PropertiesFieldlabelsRequest < PropertiesRequest
  def self.call_method
    'fieldlabels'
  end

  def self.generate_request_info(params)

    # get common Properties parameters
    class_params = generate_class_params(params)

    # query parameters for the fieldlabels call
    method_params = { :method => call_method,
                      :language => params[:language],
                      :customized => params[:customized] || 'true',
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end
end