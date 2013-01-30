class PeriodicalsRequest < Request
  def self.call_class
    "periodicals"
  end

  def self.generate_class_params(params)
    # handle params common to all Periodicals calls
    class_name = call_class()

    # query parameters common to all Periodicals calls
    {
        :class => class_name,
        :pgsize => params[:pgsize] || 50,
        :pgnum => params[:pgnum] || 1,
    }
  end
end