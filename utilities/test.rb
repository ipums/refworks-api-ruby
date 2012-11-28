require 'openssl'
require 'cgi'
require 'base64'

BASEURL = "https://www.refworks.com/api2/"
  ACCESSKEY = "***REMOVED***"
  SECRETKEY = "***REMOVED***"
  USERNAME = "test-api"
  PASSWORD = "nDStPI2gGPAtELPeuF0oyg"
  GROUPCODE = "RWUMinnTwin"

    expires = 1354085792000
    signature = CGI.escape(Base64.encode64(OpenSSL::HMAC.digest('sha1', SECRETKEY, "authentication***REMOVED***1354085792000"))) 
    signature.gsub!(/%0A/,'')
    puts signature
