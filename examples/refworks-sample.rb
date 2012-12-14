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
                         :parameter_list => [
                             {:field => "ALLAU", :search => "Henderson"},
                             {:connector => "and", :search => "economic"},
                          ],
                         :classic => 'true',
                       }
)

if response.result_code == "200"
  pp "Received " + response.total_hits + " hits, " + response.total_returned + " of which were returned."
  pp response.references
else
  pp references
  pp response.result_code.class
  pp response.result_msg
end

pp response.parsed_response

