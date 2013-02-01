class RetrieveAuthorRequest < RetrieveRequest

  def self.call_method
    'author'
  end

  def self.generate_request_info(params)

    # get common Retrieve parameters
    class_params = generate_class_params(params)

    # query parameters for the author call
    method_params = { :method => call_method,
                      :search => params[:search],
                      :folder => params[:folder], # this is optional, if nil entire account is searched
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end
end
