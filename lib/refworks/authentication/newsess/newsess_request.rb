class AuthenticationNewsessRequest < AuthenticationRequest

  def self.callMethod
    'newsess'
  end

  def self.httpRequestVerb
    'POST'
  end

  def self.generateRequestInfo(params)

    className = callClass()
    methodName = callMethod()

    # query parameters for the newsess call
    queryStringParams = {
        :class => className,
        :method => methodName,
    }

    # Construct the XML payload for the newsess call.
    loginName = params[:loginName]
    password = params[:password]
    groupCode = params[:groupCode]

    messageBody = <<-EOS
      <RWRequest class="authentication" method="newsess">
        <AcctInfo loginName="#{loginName}" groupCode="#{groupCode}" password="#{password}"></AcctInfo>
      </RWRequest>
    EOS

    # return the request info
    {:params => queryStringParams, :body => messageBody, :headers => {'Content-type' => 'text/xml'}}
  end

end
