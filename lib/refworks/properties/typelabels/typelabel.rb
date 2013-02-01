class Typelabel
  attr_reader :name, :typeOrd

  def initialize(rawtype)
    @name = rawtype["rt"]["__content__"]
    @typeOrd = rawtype["rt"]["typeOrd"]
  end
end