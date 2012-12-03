class RetrieveQuickRequest < RetrieveRequest

  def self.call_method
    'quick'
  end

  def self.generate_request_info(params)

    class_name = call_class()
    method_name = call_method()

    # query parameters for the quick call
    query_string_params = {
        :class => class_name,
        :method => method_name,
        :pgsize => params[:pgsize] || 1000,
        :pgnum => params[:pgnum] || 1,
        :search => params[:search]
    }

    # return the request info
    {:params => query_string_params}
  end

end