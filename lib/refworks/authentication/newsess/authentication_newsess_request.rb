class AuthenticationNewsessRequest < AuthenticationRequest

  def self.call_method
    'newsess'
  end

  def self.http_request_verb
    'POST'
  end

  def self.generate_request_info(params)

    class_name = call_class()
    method_name = call_method()

    # query parameters for the newsess call
    query_string_params = {
        :class => class_name,
        :method => method_name,
    }

    # Construct the XML payload for the newsess call.
    login_name = params[:login_name]
    password = params[:password]
    group_code = params[:group_code]

    message_body = <<-EOS
      <RWRequest class="authentication" method="newsess">
        <AcctInfo loginName="#{login_name}" groupCode="#{group_code}" password="#{password}"></AcctInfo>
      </RWRequest>
    EOS

    # return the request info
    {:params => query_string_params, :body => message_body, :headers => {'Content-type' => 'text/xml'}}
  end

end
