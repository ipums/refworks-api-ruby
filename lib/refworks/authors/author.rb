class Author

  attr_reader :name, :nRefs

  def initialize(rawauthor)
    @name = rawauthor["__content__"]
    @nRefs = rawauthor["nRefs"]
  end

end