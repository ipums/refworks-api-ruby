# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class ReferenceEditRequest < ReferenceRequest
  def self.call_method
    'edit'
  end

  def self.http_request_verb
    'POST'
  end

  def self.generate_request_info(params)

    # get common Reference parameters
    class_params = generate_class_params(params)

    # query parameters for the edit call
    method_params = { :method => call_method,
    }

    query_string_params = class_params.merge(method_params)
    # add has a POST payload

    # construct XML payload
    xml_payload = '<RWRequest class="reference" method="edit"><RWRefData><refworks xmlns:refworks="www.refworks.com/xml/">'
    params[:references].each do |ref|
      xml_payload << ref.to_refworks_xml
    end

    xml_payload << '</refworks></RWRefData></RWRequest>'

    message_body = xml_payload

    # return the request info
    {:params => query_string_params, :body => message_body, :headers => {'Content-type' => 'text/xml'}}
  end
end