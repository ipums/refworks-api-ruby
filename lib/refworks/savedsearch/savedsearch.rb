# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class Savedsearch
  attr_reader :name, :parameterlist, :folderlist

  def initialize(rawss)
    @name = rawss["name"]
    paramlist = rawss["ParameterList"]

    @parameterlist = Array.new

    if paramlist.class == Array
      paramlist.each do |param|
        @parameterlist << SavedsearchParameter.new(param)
      end
    else
      @parameterlist << SavedsearchParameter.new(paramlist)
    end

    @folderlist = Array.new
    @folderlist << rawss["FolderList"]
  end
end