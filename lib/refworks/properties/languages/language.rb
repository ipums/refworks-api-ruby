class Language
  attr_reader :name, :code

  def initialize(rawlang)
    @name = rawlang["name"]
    @code = rawlang["code"]
  end
end