class SavedsearchParameterComponent
  attr_reader :connector, :field, :searchempty, :content

  def initialize(rawcomponent)
    @content = rawcomponent["__content__"]
    @connector = rawcomponent["connector"]
    @field = rawcomponent["field"]
    @searchempty = rawcomponent["searchempty"]
  end
end