class Folder
  attr_reader :name, :nRefs, :type

  def initialize(rawfolder)
    @name = rawfolder["__content__"]
    @nRefs = rawfolder["nRefs"]
    @type = rawfolder["type"]
  end

end