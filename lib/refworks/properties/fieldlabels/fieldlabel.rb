class Fieldlabel
  attr_reader :label, :name, :type, :displayorder, :includefld, :maxlen, :lookup

  def initialize(rawfl)
    @name = rawfl["__content__"]
    @type = rawfl["type"]
    @displayorder = rawfl["displayOrder"]
    @includefld = rawfl["includefld"]
    @maxlen = rawfl["maxlen"]
    @lookup = rawfl["lookup"]
  end

end