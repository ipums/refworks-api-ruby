class ManuscriptByidRequest < ManuscriptRequest
  def self.call_method
    'byid'
  end

  def self.http_request_verb
    'POST'
  end

  def self.generate_request_info(params)

    # get common Manuscript parameters
    class_params = generate_class_params(params)

    # query parameters for the byid call
    method_params = { :method => call_method,
    }

    query_string_params = class_params.merge(method_params)

    # Construct the XML payload for the byid call.
    ids = params[:ids]

    message_body = '<RWRequest class="manuscript" method="byid">'
    message_body << ids.collect{ |x| "<id>#{x}</id>"}.join
    message_body << '</RWRequest>'

    # return the request info
    {:params => query_string_params, :body => message_body, :headers => {'Content-type' => 'text/xml'}}
  end

end