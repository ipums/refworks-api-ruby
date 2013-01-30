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

#response = rwc.request(:class_name => 'authors',
#                       :method_name => 'all',
#                       :method_params => {},
#)


#response = rwc.request(:class_name => 'authors',
#                       :method_name => 'search',
#                       :method_params => {:search => 'Smith'},
#)


#response = rwc.request(:class_name => 'descriptors',
#                       :method_name => 'all',
#                       :method_params => {},
#)


#response = rwc.request(:class_name => 'descriptors',
#                       :method_name => 'search',
#                       :method_params => {:search => '%Segregation%'},
#)


#response = rwc.request(:class_name => 'periodicals',
#                       :method_name => 'all',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'periodicals',
#                       :method_name => 'search',
#                       :method_params => {:search => 'Am'},
#)

#response = rwc.request(:class_name => 'folders',
#                       :method_name => 'all',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'folders',
#                       :method_name => 'search',
#                       :method_params => {:search => 'test'},
#)

#response = rwc.request(:class_name => 'importfilter',
#                       :method_name => 'allavailable',
#                       :method_params => {:includedb => 'true'},
#)

#response = rwc.request(:class_name => 'importfilter',
#                       :method_name => 'allglobal',
#                       :method_params => {:includedb => 'true'},
#)

#response = rwc.request(:class_name => 'importfilter',
#                       :method_name => 'favorites',
#                       :method_params => {:includedb => 'false'},
#)

#response = rwc.request(:class_name => 'importfilter',
#                       :method_name => 'search',
#                       :method_params => {:includedb => 'false', :search => 'MED'},
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'encoding',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'fieldlabels',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'sourcetypes',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'typelabels',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'languages',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'outputlanguage',
#                       :method_params => {},
#)

response = rwc.request(:class_name => 'properties',
                       :method_name => 'sortlocales',
                       :method_params => {},
)

if response.result_code == "200"
  #pp "Received " + response.total_hits + " hits, " + response.total_returned + " of which were returned."
  #pp response.importfilters
else
  #pp references
  pp response.result_code.class
  pp response.result_msg
end

pp response.parsed_response

