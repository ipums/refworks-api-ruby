# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class ReferenceAddRequest < ReferenceRequest
  def self.call_method
    'add'
  end

  def self.http_request_verb
    'POST'
  end

  def self.generate_request_info(params)

    # get common Reference parameters
    class_params = generate_class_params(params)

    # query parameters for the add call
    method_params = { :method => call_method,
                      :folder => params[:folder], # this is optional
                      :returnrefs => params[:returnrefs] || "0", # this is technically optional but I'm explicitly passing default of 0
    }

    query_string_params = class_params.merge(method_params)
    # add has a POST payload

    # construct XML payload
    xml_payload = '<RWRequest class="reference" method="add"><RWRefData><refworks xmlns:refworks="www.refworks.com/xml/">'
    params[:references].each do |ref|
      xml_payload << ref.to_refworks_xml
    end
#    xml_payload << '<reference>
#<rt>Book, Whole</rt>
#<sr>Print(0)</sr>
#<id>330</id>
#<t1>
#4898816 <B>Mediat</B>&lt;&gt;ors for bioelectrochemical <SUP>cells</SUP> h20 to test for microbiologlklklkicakkkl activity. <U>Anthony</U> P F Turner, Ann Swain, Graha <I>Ramsay</I>, Marc Cardosi, Bernard H Schneider, www.refworks.com?a=23&amp;b=34 Cranfield, United Kingdom assigned to Paul de la Pena Limitedl
#</t1>
#<jf>Biotechnology Advances</jf>
#<jo>Biotechnol.Adv.</jo>
#<yr>1990</yr>
#<vo>8</vo>
#<is>3</is>
#<sp>613</sp>
#<no>JID: 8403708; <I>ppublish</I></no>
#<a1>Aggarwal,A.</a1>
#<a1>Schneider,D. J.</a1>
#<a1>Sobel,B. E.</a1>
#<a1>Dauerman,H. L.</a1>
#<t3>this is a title</t3>
#<sn>0734-9750</sn>
#<an>14549739; 0</an>
#<la>ENG</la>
#<sf>JOURNAL ARTICLE</sf>
#<do>073497509090779B [pii]</do>
#<st>this is a <U>shortened</U> title</st>
#<ol>Unknown(0)</ol>
#</reference>'
    xml_payload << '</refworks></RWRefData></RWRequest>'

    message_body = xml_payload

    # return the request info
    {:params => query_string_params, :body => message_body, :headers => {'Content-type' => 'text/xml'}}
  end
end