class RetrieveCountRequest < RetrieveRequest
  def self.call_method
    'count'
  end

  def self.generate_request_info(params)

    # get common Retrieve parameters
    class_params = generate_class_params(params)

    # query parameters for the count call
    method_params = { :method => call_method,
                      :attachonly => params[:attachonly] || 'false',
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end
end