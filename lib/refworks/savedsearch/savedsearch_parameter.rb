# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

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