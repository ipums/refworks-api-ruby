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

    # query parameters for the advancesearch call
    method_params = { :method => call_method,
                      :classic => params[:classic] || 'true',
                      :search => params[:search],
    }

    query_string_params = class_params.merge(method_params)
    # advancesearch also has a POST payload

    # construct ParameterList
    parameter_list = "<ParameterList>"
    params[:parameter_list].each do |param|
      connector = param[:connector] || "and"
      field = param[:field] || "ALL"
      searchempty = param[:searchempty] || "false"
      parameter_list << "<Parameter connector=\"#{connector}\" field=\"#{field}\" searchempty=\"#{searchempty}\">#{param[:search]}</Parameter>"
    end
    parameter_list << "</ParameterList>"

    # Folder processing
    folder_list = ""
    if params[:folders]
      folder_list << "<FolderList>"
      params[:folders].each do |f|
        folder_list << "<Folder>#{f}</Folder>"
      end
      folder_list << "</FolderList>"
    end

    message_body = "<AdvancedSearchStrategy>" + parameter_list + folder_list + "</AdvancedSearchStrategy>"

    # return the request info
    {:params => query_string_params, :body => message_body, :headers => {'Content-type' => 'text/xml'}}
  end

end