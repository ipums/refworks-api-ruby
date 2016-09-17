# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class Fieldlabel
  attr_reader :label, :name, :type, :displayorder, :includefld, :maxlen, :lookup

  def initialize(rawfl)
    @name = rawfl["__content__"]
    @type = rawfl["type"]
    @displayorder = rawfl["displayOrder"]
    @includefld = rawfl["includefld"]
    @maxlen = rawfl["maxlen"]
    @lookup = rawfl["lookup"]
  end

end