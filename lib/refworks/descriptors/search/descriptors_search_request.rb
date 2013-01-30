class DescriptorsSearchRequest < DescriptorsRequest

  def self.call_method
    'search'
  end

  def self.generate_request_info(params)

    # get common Descriptors parameters
    class_params = generate_class_params(params)

    # query parameters for the search call
    method_params = { :method => call_method,
                      :search => params[:search],
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end


end