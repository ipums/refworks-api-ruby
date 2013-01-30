class Periodical
  attr_reader :name, :nRefs

  def initialize(rawperiodical)
    @name = rawperiodical["__content__"]
    @nRefs = rawperiodical["nRefs"]
  end

end