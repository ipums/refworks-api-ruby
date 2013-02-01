class SavedsearchParameter
  attr_reader :components

  def initialize(rawparam)

    comps = rawparam["Parameter"]

    @components = Array.new

    if comps.class == Array
      comps.each do |comp|
        @components << SavedsearchParameterComponent.new(comp)
      end
    else
      @components << SavedsearchParameterComponent.new(comps)
    end
  end
end