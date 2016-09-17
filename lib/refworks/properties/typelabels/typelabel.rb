# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class Typelabel
  attr_reader :name, :typeOrd

  def initialize(rawtype)
    @name = rawtype["rt"]["__content__"]
    @typeOrd = rawtype["rt"]["typeOrd"]
  end
end