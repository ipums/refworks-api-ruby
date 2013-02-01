refworks-api-ruby
=================

A Ruby interface to the RefWorks API.

Usage
-----

Please see examples/ in the source code repo for sample configuration and usage.

In particular, please read the comments in refworks-sample.rb, as they contain important information about how
to determine the set of parameters needed for each API method call.

Current Status
--------------

The code is currently ALPHA quality.  It has received minimal testing and needs more edge case checking and such.
I've opted to release early to see if there is community interest in further development.  For a first pass, I
focused on implementing (some of) the read portions of the API, so that the code could be used against an
RefWorks database which is already populated.

Class-by-class status and notes are below.

Attachments
  - Nothing implemented

Authentication
  - delsess, newsess, newtempusersess, ping, userexists are implemented.
  - newrefsharesess not implemented.

Authors,Descriptors,Periodicals,Folders
  - all and search are implemented.
  - addref (GET), addref (POST), clear, create, delete, edit, removeref (GET), removeref (POST) are not implemented.
  - note that in the code, these are broken out into four different classes.

Batch
  - Nothing implemented.

Deleted
  - Nothing implemented.

ImportFilter
  - allavailable, allglobal, favorites, search are implemented.
  - savelastused is not implemented.

Manuscript
  - all, baseurl, byid, file, folder, mylist are implemented.
  - openoffice, word, xml are not implemented.

MyList
  - Nothing implemented.

OutputStyle
  - Nothing implemented.

Properties [Complete]
  - encoding, fieldlabels, languages, outputlanguage, sortlocales, sourcetypes, typelabels are implemented.

PubMed
  - Nothing implemented.

Reference
  - get implemented.
  - add, addcomment, delete (GET), delete (POST), deletecomment, edit, editcomment, globaledit, import,
    importendnote, importpreview, openurl not implemented.

Retrieve
  - advancesearch, all, author, byid, count, descriptor, dup, folder, modsince, nofolder, periodical, quick,
    saved, specialfolder implemented.
  - byid (POST), openurl not implemented.

RSS
  - Nothing implemented.

SavedSearch
  - all, get implemented.
  - add, delete, edit not implemented.

ShareProperties
  - Nothing implemented.

Subscriber
  - Nothing implemented.

SubscriberPrefs
  - Nothing implemented.

User
  - Nothing implemented.

Utility
  - Nothing implemented.

Z39
  - Nothing implemented.

Basic Code Flow
---------------

1.  The user instantiates a Refworks client (Refworks.new).  Refworks sets up a session via the API as part of
    initialization.
2.  The user issues an API request by invoking Refworks.request.
3.  Refworks.request resolves and instantiates the Request class for the specific API method being called
    (e.g. RetrieveAllRequest).
4.  Refworks.request uses the method-specific Request class (for method-specific parameters) and the to assemble
    the query string, determine the URL and HTTP verb to use, and issues the request.
5.  Refworks.request receives the response and instantiates the method-specific Response class
    (e.g. RetrieveAllResponse).
6.  The user accesses the method-specific Response class to retrieve the data and/or return codes for the operation.

Each Response class returns its own set of data - for example, a call to the all method of the retrieve class
returns a set of Reference objects, whereas a call to the search method of the authors class returns a set of
Author objects.  See the documentation for each class and method for full details.

Useful Links
------------

RefWorks API Reference: http://rwt.refworks.com/rwapireference/
RefWorks Tagged Format Reference: http://www.refworks.com/rwathens/help/RefWorks_Tagged_Format.htm

