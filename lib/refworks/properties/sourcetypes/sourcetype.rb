class Sourcetype
  attr_reader :name, :id

  def initialize(rawtype)
    @name = rawtype["__content__"]
    @id = rawtype["id"]
  end
end