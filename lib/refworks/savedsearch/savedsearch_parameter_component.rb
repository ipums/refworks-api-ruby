# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class SavedsearchParameterComponent
  attr_reader :connector, :field, :searchempty, :content

  def initialize(rawcomponent)
    @content = rawcomponent["__content__"]
    @connector = rawcomponent["connector"]
    @field = rawcomponent["field"]
    @searchempty = rawcomponent["searchempty"]
  end
end