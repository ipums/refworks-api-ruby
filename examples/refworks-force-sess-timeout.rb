# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

#test script - probably deprecated
$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/..')
require 'lib/refworks.rb'
require 'examples/config/config.rb'

rwc = Refworks.new(RefworksConfig::CONFIG)

rwc.sess = "___BADSESSKEY___"
response = rwc.request('retrieve', 'author', {:search => "Rhode,Paul W.", :folder => 'testfolder'})


exit
