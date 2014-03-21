# test script to expose bug
require 'httparty'

class Refworks
  include HTTParty
  debug_output $stdout
end

expires = Time.now.to_i * 1000

# RW formula for signature message
# call class + access key + expires.to_s.chomp
signature = 'retrieve' + '***REMOVED***' + expires.to_s.chomp
hmacsig = OpenSSL::HMAC.digest('sha1', '***REMOVED***', signature)
encodedsig = Base64.strict_encode64(hmacsig)

response = Refworks.get("http://www.refworks.com/accessrw/?class=retrieve&pgsize=50&pgnum=1&format=html&sort=&style=0&language=en&biblist=false&method=author&search=Rhode%2CPaul+W.&folder=testfolder&signature=#{encodedsig}&accesskeyid=h83KW875%5Eousl&expires=#{expires}&sess=___BADSESSKEY___");
p response