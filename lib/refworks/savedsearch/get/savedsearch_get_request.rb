class SavedsearchGetRequest < SavedsearchRequest
  def self.call_method
    'get'
  end

  # @param [Object] params
  def self.generate_request_info(params)

    # get common Savedsearch parameters
    class_params = generate_class_params(params)

    # query parameters for the get call
    method_params = { :method => call_method,
                      :saved => params[:saved],
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end
end