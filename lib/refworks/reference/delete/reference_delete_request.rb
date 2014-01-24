class ReferenceDeleteRequest < ReferenceRequest
  def self.call_method
    'delete'
  end

  def self.http_request_verb
    'GET'
  end

  def self.generate_request_info(params)

    # get common Reference parameters
    class_params = generate_class_params(params)

    # query parameters for the delete call
    method_params = { :method => call_method,
                      :id => params[:ids],
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end
end