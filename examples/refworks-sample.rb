$LOAD_PATH << File.expand_path(File.dirname(File.realpath(__FILE__)) + '/..')
require File.expand_path('lib/refworks.rb')
require 'examples/config/config.rb'

rwc = Refworks.new(RefWorks::Config::CONFIG)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'quick',
#                       :method_params => {
#                         :search => "Jones",
#                       }
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'advancesearch',
#                       :method_params => {
#                         :parameter_list => [
#                             {:field => "ALLAU", :search => "Henderson"},
#                             {:connector => "and", :search => "economic"},
#                          ],
#                         :classic => 'true',
#                       }
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'all',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'periodical',
#                       :method_params => {:search => "Family and Marriage"},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'byid',
#                       :method_params => {:id => [42154, 42160, 42400]},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'dup',
#                       :method_params => {:search => 'close'},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'folder',
#                       :method_params => {:search => 'testfolder'},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'modsince',
#                       :method_params => {:search => '999999999999'},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'nofolder',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'saved',
#                       :method_params => {:saved => 'fransearch', :classic => 'true'},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'specialfolder',
#                       :method_params => {:search => 'deleted'},
#)

#response = rwc.request(:class_name => 'authentication',
#                   :method_name => 'userexists',
#                   :method_params => {
#                       :login_name => "nouser",
#                       :group_code => rwc.group_code,
#                       :password => rwc.password,
#                   }
#)

#response = rwc.request(:class_name => 'authentication',
#                       :method_name => 'newtempusersess',
#                       :method_params => {},
#)

if response.result_code == "200"
  #pp "Received " + response.total_hits + " hits, " + response.total_returned + " of which were returned."
  #pp response.references
else
  #pp references
  pp response.result_code.class
  pp response.result_msg
end

pp response.parsed_response

