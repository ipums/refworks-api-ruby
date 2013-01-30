class PropertiesLanguagesRequest < PropertiesRequest
  def self.call_method
    'languages'
  end

  def self.generate_request_info(params)

    # get common Properties parameters
    class_params = generate_class_params(params)

    # query parameters for the languages call
    method_params = { :method => call_method,
                      :language => params[:language],
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end

end