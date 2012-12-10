class RetrieveAdvancesearchRequest < RetrieveRequest

  def self.call_method
    'advancesearch'
  end

  def self.http_request_verb
    'POST'
  end

  def self.generate_request_info(params)

    # get common Retrieve parameters
    class_params = generate_class_params(params)

    # query parameters for the quick call
    method_params = { :method => call_method,
                      :classic => params[:classic] || 'true',
    }

    query_string_params = class_params.merge(method_params)
    # advancesearch also has a POST payload

    message_body = <<-EOS
      <ParameterList>
        <Parameter connector="and">Jones</Parameter>
      </ParameterList>
    EOS

    # return the request info
    {:params => query_string_params, :body => message_body, :headers => {'Content-type' => 'text/xml'}}
  end

end