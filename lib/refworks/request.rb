

class Request
  require 'rubygems'
  require 'base64'
  require 'openssl'

  def self.http_request_verb
    'GET'
  end

  def self.generate_signature(call_class, access_key, secret_key)

    # Construct the RW-required signature using the algorithm from their docs
    # expires should be the current time represented in microseconds since the epoch
    expires = Time.now.to_i * 1000

    # RW formula for signature message
    signature = call_class + access_key + expires.to_s.chomp

    # Run it through HMAC SHA1 using secret key
    hmacsig = OpenSSL::HMAC.digest('sha1', secret_key, signature)

    # Base64 encode it
    # Ruby 1.8 way
    #encodedsig = Base64.encode64(hmacsig)
    # Ruby 1.9.2 way
    encodedsig = Base64.strict_encode64(hmacsig)

    # Base64.encode64 adds a newline at end of string if not present.  This strips it.
    # Otherwise, you get an Invalid Signature error from RW
    # Do this if you are using Ruby 1.8 and don't have access to strict_encode64 as used above
    #encodedsig.gsub!(/%0A/,'')

    # Return hash
    {:signature => encodedsig, :accesskeyid => access_key, :expires => expires}
  end

end
