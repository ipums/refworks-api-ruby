class Fieldlabel
  attr_reader :label, :name, :type, :displayorder, :includefld, :typeOrd, :maxlen, :lookup

  def initialize(label, rawfl)
    @name = rawfl["__content__"]
    @label = label
    @type = rawfl["type"]
    @displayorder = rawfl["displayOrder"]
    @includefld = rawfl["includefld"]
    @typeord = rawfl["typeOrd"]
    @maxlen = rawfl["maxlen"]
    @lookup = rawfl["lookup"]
  end

end