# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

# The Author class base abstract request class.
# Parameters common to all Author class calls are captured here.
#
# @abstract
# @api private
class AuthorsRequest < Request
  def self.call_class
    "authors"
  end

  # Handle parameters common to all Author calls.
  # @param [Hash] params All Author class calls should include the params :pgsize and :pgnum in their method_params.
  def self.generate_class_params(params)
    class_name = call_class()

    # query parameters common to all Authors calls
    {
        :class => class_name,
        :pgsize => params[:pgsize] || 50,
        :pgnum => params[:pgnum] || 1,
    }
  end
end