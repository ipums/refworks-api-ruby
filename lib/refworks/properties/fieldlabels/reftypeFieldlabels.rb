# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

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