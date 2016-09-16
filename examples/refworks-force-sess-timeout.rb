#test script - probably deprecated
$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/..')
require 'lib/refworks.rb'
require 'examples/config/config.rb'

rwc = Refworks.new(RefworksConfig::CONFIG)

rwc.sess = "___BADSESSKEY___"
response = rwc.request('retrieve', 'author', {:search => "Rhode,Paul W.", :folder => 'testfolder'})


exit
