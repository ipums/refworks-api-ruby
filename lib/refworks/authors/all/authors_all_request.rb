# The Author class all method call.
# This call has no method-specific parameters.
#
# Users will not instantiate this class directly; the Refworks.request method will do so.
# @api private
class AuthorsAllRequest < AuthorsRequest
  def self.call_method
    'all'
  end

  # Assembles the information needed to construct the query string for this request
  # @param [Hash] params This should be an empty hash.  This call has no method-specific parameters.
  # @return [Hash] Returns hash of request parameters for this call.
  def self.generate_request_info(params)

    # get common Authors parameters
    class_params = generate_class_params(params)

    # query parameters for the all call
    method_params = { :method => call_method,
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end

end