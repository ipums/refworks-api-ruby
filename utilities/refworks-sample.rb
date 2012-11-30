  require File.expand_path('../lib/refworks.rb')
#require './config.rb'

config = {:accessKey => '***REMOVED***',
          :secretKey => '***REMOVED***',
          :groupCode => 'RWUMinnTwin',
          :loginName => 'test-api',
          :password  => 'nDStPI2gGPAtELPeuF0oyg',
          :apiURL    => 'https://www.refworks.com/api2/',
}

rwc = Refworks.new(config)

response = rwc.request(:className => 'authentication',
            :methodName => 'Newsess',
            :methodParams => {
                :loginName => rwc.loginName(),
                :groupCode => rwc.groupCode(),
                :password => rwc.password(),
            })

