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