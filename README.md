refworks-api-ruby
=================

A Ruby interface to the RefWorks API.

Usage
-----

Please see refworks-sample.rb in examples/ for sample usage.

Caveats
-------

Currently, only the authentication and retrieve classes are implemented.  Class-specific notes below.

Authentication class
  - newrefsharesess is not implemented yet, as it has dependencies on ShareProperties class, which is
    also not implemented yet.

Retrieve class
  - The byid method has both GET and POST versions.  Only GET is implemented in this interface.
  - The openurl method is not implemented in this interface.  Implementation has been deferred
    until # of users demonstrating interest in feature > 0.

Useful Links
------------

RefWorks Tagged Format Reference: http://www.refworks.com/rwathens/help/RefWorks_Tagged_Format.htm

