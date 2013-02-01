class Outputlanguage
  attr_reader :name, :id

  def initialize(rawlang)
    @name = rawlang["__content__"]
    @id = rawlang["id"]
  end
end