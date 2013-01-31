class ManuscriptAllRequest < ManuscriptRequest
  def self.call_method
    'all'
  end

  def self.generate_request_info(params)

    # get common Manuscript parameters
    class_params = generate_class_params(params)

    # query parameters for the baseurl call
    method_params = { :method => call_method,
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end


end