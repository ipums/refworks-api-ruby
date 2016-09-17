# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class Importfilter
  attr_reader :name, :id, :owner, :databases

  def initialize(rawfilter)
    @name = rawfilter["Name"]
    @id = rawfilter["id"]
    @owner = rawfilter["owner"]
    @databases = Array.new

    # Promote all returned database values to arrays in the object, even if one database returned, for consistency
    if rawfilter["Database"].class == Array
      @databases = rawfilter["Database"]
    else
      @databases << rawfilter["Database"]
    end
  end

end