class RetrieveQuickRequest < RetrieveRequest

  def self.call_method
    'quick'
  end

  def self.generate_request_info(params)

    # get common Retrieve parameters
    query_string_params = generate_class_params(params)

    # query parameters for the quick call
    query_string_params[:method] = call_method

    # return the request info
    {:params => query_string_params}
  end

end