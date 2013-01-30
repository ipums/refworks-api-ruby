class Descriptor
  attr_reader :name, :nRefs

  def initialize(rawdesc)
    @name = rawdesc["__content__"]
    @nRefs = rawdesc["nRefs"]
  end
end