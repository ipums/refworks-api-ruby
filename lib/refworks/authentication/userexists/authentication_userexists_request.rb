class AuthenticationUserexistsRequest < AuthenticationRequest
  def self.call_method
    'userexists'
  end

  def self.http_request_verb
    'POST'
  end

  def self.generate_request_info(params)

    # get common Authentication parameters
    class_params = generate_class_params(params)

    # query parameters for the ping call
    method_params = { :method => call_method,
    }

    query_string_params = class_params.merge(method_params)

    # Construct the XML payload for the userexists call.
    login_name = params[:login_name]
    password = params[:password]
    group_code = params[:group_code]

    message_body = <<-EOS
      <RWRequest class="authentication" method="userexists">
        <AcctInfo loginName="#{login_name}" groupCode="#{group_code}" password="#{password}"></AcctInfo>
      </RWRequest>
    EOS

    # return the request info
    {:params => query_string_params, :body => message_body, :headers => {'Content-type' => 'text/xml'}}
  end


end