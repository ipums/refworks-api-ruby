require 'rubygems'
require 'HTTParty'
require 'base64'
require 'cgi'
require 'openssl'

module RefWorksAPI
  include HTTParty
  debug_output $stderr

  BASEURL = "https://www.refworks.com/api2/"
  ACCESSKEY = "***REMOVED***"
  SECRETKEY = "***REMOVED***"
  USERNAME = "test-api"
  PASSWORD = "nDStPI2gGPAtELPeuF0oyg"
  GROUPCODE = "RWUMinnTwin"

  def RefWorksAPI.generateSignature(callClass, accessKey, secretKey) 
    expires = Time.now.to_i * 1000
    signature = callClass + accessKey + expires.to_s.chomp
    hmacsig = OpenSSL::HMAC.digest('sha1', secretKey, signature)
    encodedsig = Base64.encode64(hmacsig)
    puts encodedsig
    encodedsig = CGI.escape(encodedsig)
    puts encodedsig
    encodedsig.gsub!(/%0A/,'')
    puts encodedsig
    {:signature => encodedsig, :expires => expires}
  end  

  def RefWorksAPI.getSession(signature, expires)
    encodedaccesskey = CGI.escape(ACCESSKEY)
    urlparams = "class=authentication&method=newsess&accesskeyid=#{encodedaccesskey}&signature=#{signature}&expires=#{expires}"
    url = BASEURL + "?#{urlparams}"
    puts url
    messageBody = <<EOS
<RWRequest class="authentication" method="newsess"><AcctInfo loginName="#{USERNAME}" groupCode="#{GROUPCODE}" password="#{PASSWORD}"></AcctInfo></RWRequest>
EOS
    puts messageBody

    post(url, :body => messageBody, :headers => {'Content-type' => 'text/xml'})
  end
end

sighash = RefWorksAPI.generateSignature("authentication", RefWorksAPI::ACCESSKEY, RefWorksAPI::SECRETKEY)
response = RefWorksAPI.getSession(sighash[:signature], sighash[:expires]);
puts response.body

=begin

        if ($requestClass::requiresSession()) {
            $response = $this->request(array(
                'class' => 'Authentication',
                'method' => 'newsess',
                'methodParams' => array(
                    'loginName' => $this->loginName(),
                    'groupCode' => $this->groupCode(),
                    'password' => $this->password(),
                ),
            ));




        $subscriberid = '1667'; // What is this for?

        $rwc = new \RefWorksAPI\Client(array(
            'groupCode' => 'RWUMinnTwin',

            // These are UMN authentication credentials, so please don't
            // distribute this code without permission!
            'accesskeyid' => '***REMOVED***',
            'secretkey' => '***REMOVED***',

            // These credentials are for only for testing and are not as sensitive.
            'loginName' => 'test-api',
            'password' => 'nDStPI2gGPAtELPeuF0oyg',

protected function generateSignatureParams($class)
    {
        $expires = time() * 1000; // Poor man's milliseconds.
        $signature = base64_encode(hash_hmac('sha1', $class . $this->accesskeyid() . $expires, $this->secretkey(), TRUE));
        return array(
            'signature' => urlencode($signature),
            'accesskeyid' => urlencode($this->accesskeyid()),
            'expires' => $expires
        );
    }
=end
