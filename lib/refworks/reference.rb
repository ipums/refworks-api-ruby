class Reference
  attr_reader :id, :a1, :authors, :t1, :k1, :ab, :abstract, :sr, :ol, :fl, :cd, :md, :no

  # expecting a HTTParty-parsed RWResult reference hash to be passed in
  def initialize(ref)
    pp ref
    @a1 = ref["a1"]
    @authors = @a1
    @ab = ref["ab"]
    @abstract = @ab
  end
end