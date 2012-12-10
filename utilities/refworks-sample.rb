require File.expand_path('../lib/refworks.rb')
require './config/config.rb'

rwc = Refworks.new(RefWorks::Config::CONFIG)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'quick',
#                       :method_params => {
#                         :search => "Jones",
#                       }
#)

response = rwc.request(:class_name => 'retrieve',
                       :method_name => 'advancesearch',
                       :method_params => {
                         :search => "Jones",
                       }
)

pp "Received " + response.total_hits + " hits, " + response.total_returned + " of which were returned."
pp response.references

