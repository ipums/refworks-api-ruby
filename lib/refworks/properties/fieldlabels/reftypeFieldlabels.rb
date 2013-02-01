class ReftypeFieldlabels
  attr_reader :typeord, :fieldlabels

  def initialize(raw_rt)
    @typeord = raw_rt["rt"]["typeOrd"]
    @fieldLabels = Hash.new
    raw_rt.each do |field, fieldval|
      @fieldLabels[field] = Fieldlabel.new(fieldval)
    end
  end
end