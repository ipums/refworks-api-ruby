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