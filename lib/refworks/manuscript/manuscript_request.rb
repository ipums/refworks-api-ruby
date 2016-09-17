# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class ManuscriptRequest < Request
  def self.call_class
    "manuscript"
  end

  def self.generate_class_params(params)
    # handle params common to all Manuscript calls
    class_name = call_class()

    # query parameters common to all Manuscript calls
    {
        :class => class_name,
        :id => params[:id],
        :fileformat => params[:fileformat],
        :maxrefs => params[:maxrefs] || 999999,
        :language => params[:language] || 'en',
        :base_url => params[:base_url] || nil,
    }
  end
end