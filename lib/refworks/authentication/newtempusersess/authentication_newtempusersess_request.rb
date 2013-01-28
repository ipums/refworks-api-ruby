class AuthenticationNewtempusersessRequest < AuthenticationRequest
  def self.call_method
    'newtempusersess'
  end

  def self.generate_request_info(params)

    # get common Authentication parameters
    class_params = generate_class_params(params)

    # query parameters for the newtempusersess call
    method_params = { :method => call_method,
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end

end