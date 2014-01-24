class ReferenceAddcommentRequest < ReferenceRequest
  def self.call_method
    'addcomment'
  end

  def self.http_request_verb
    'POST'
  end

  def self.generate_request_info(params)

    # get common Reference parameters
    class_params = generate_class_params(params)

    # query parameters for the addcomment call
    method_params = { :method => call_method,
                      :id => params[:id],
    }

    query_string_params = class_params.merge(method_params)
    # addcomment has a POST payload

    # construct XML payload
    xml_payload = '<RWRequest class="reference" method="addcomment">'
    params[:comments].each do |cmnt|
      title = cmnt[:title]
      name = cmnt[:name]
      inetinfo = cmnt[:inetinfo]
      comment = cmnt[:comment]
      parentid = cmnt[:parentid] || "-1"
      xml_payload << "<comment id=\"\" title=\"#{title}\" name=\"#{name}\" inetinfo=\"#{inetinfo}\" created=\"\" comment=\"#{comment}\" parentid=\"#{parentid}\"/>"
    end

    xml_payload << '</RWRequest>'

    message_body = xml_payload

    # return the request info
    {:params => query_string_params, :body => message_body, :headers => {'Content-type' => 'text/xml'}}
  end
end