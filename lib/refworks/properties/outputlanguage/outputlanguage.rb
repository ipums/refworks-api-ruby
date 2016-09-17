# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class Outputlanguage
  attr_reader :name, :id

  def initialize(rawlang)
    @name = rawlang["__content__"]
    @id = rawlang["id"]
  end
end