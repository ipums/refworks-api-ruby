class RetrieveModsinceRequest < RetrieveRequest
  def self.call_method
    'modsince'
  end

  def self.generate_request_info(params)

    # get common Retrieve parameters
    class_params = generate_class_params(params)

    # query parameters for the byid call
    method_params = { :method => call_method,
                      :search => params[:search],
                      :skipref => params[:skipref] || 0,
                      :attachonly => params[:attachonly] || "false",
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end
end