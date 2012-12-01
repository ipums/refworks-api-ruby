require File.expand_path('../lib/refworks.rb')
require './config/config.rb'

rwc = Refworks.new(RefWorks::Config::CONFIG)

response = rwc.request(:class_name => 'authentication',
                       :method_name => 'newsess',
                       :method_params => {
                         :login_name => rwc.login_name(),
                         :group_code => rwc.group_code(),
                         :password => rwc.password(),
                       }
                      )

pp response.body