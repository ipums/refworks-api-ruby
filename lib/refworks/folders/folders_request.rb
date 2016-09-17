# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class FoldersRequest < Request
  def self.call_class
    "folders"
  end

  def self.generate_class_params(params)
    # handle params common to all Folders calls
    class_name = call_class()

    # query parameters common to all Folders calls
    {
        :class => class_name,
        :pgsize => params[:pgsize] || 50,
        :pgnum => params[:pgnum] || 1,
    }
  end
end