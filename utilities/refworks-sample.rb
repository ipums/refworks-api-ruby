require File.expand_path('../lib/refworks.rb')
require './config/config.rb'

rwc = Refworks.new(RefWorks::Config::CONFIG)

response = rwc.request(:class_name => 'retrieve',
                       :method_name => 'quick',
                       :method_params => {
                         :search => "Jones",
                         :pgsize => 10,
                         :pgnum => 3,
                       }
)

pp "Received " + response.total_hits + " hits, " + response.total_returned + " of which were returned."
pp response.references

