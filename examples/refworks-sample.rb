$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/..')
require 'lib/refworks.rb'
require 'examples/config/config.rb'

rwc = Refworks.new(RefworksConfig::CONFIG)

# IMPORTANT INFORMATION ABOUT API METHOD CALLS
#
# How to determine what to include in method_params in a request call
# -------------------------------------------------------------------
#
# Each method call in the Refworks API expects a different set of parameters.  Often, some of these have
# defaults and you are not required to explicitly include each one.  Sometimes these defaults are specified
# by the Refworks API (e.g. language set to 'en' for Manuscript class methods), and sometimes the defaults are
# coded into the Ruby client (e.g. default pgsize of 50 for all calls to the Retrieve class methods.)
#
# There are two basic approaches to figure out what you need to include in your call.
#
# Note: The client will always add the class and method parameters for you.  You do not need to add them to your
# method_params (you're already providing them via class_name and method_name to the request call).
#
# The Easy Way
# ------------
#
# Use the Refworks API documentation.  It can be found at http://rwt.refworks.com/rwapireference/
# Click through to the method you want to call by first clicking on the Class and then on the Method.
# Each method's documentation page has a parameter list.  Those are the parameters you can specify (in
# all lowercase) within the method_params hash of your request call.  Refworks API defaults will be listed
# here, and unless noted otherwise, those are carried over into the Ruby client and you can omit them.
#
# The downside to doing this is that it's not always obvious where the client deviates from or does not fully
# implement the API.  There are cases where the client accepts only a subset of the values that are valid according
# to the API spec (read "The Hard Way" below for an example).  Caveat emptor.
#
# The Hard Way
# ------------
#
# Use the source code.  This is trickier because the full set of required parameters can only be determined
# by combining information from multiple places.  It's best explained using an example:
#
# Let's say I want to make a call to the author method of the retrieve class, to retrieve references by a specific
# author.  By looking at the API documentation, I can determine that the full set of parameters for this call is
# class, method, search, folder (optional), pgnum, pgsize, sort (optional), style (optional), language (optional),
# format (optional) and biblist (optional).
#
# This can also be determined by source code examination.  You'll need to look at both RetrieveRequest and
# RetrieveAuthorRequest.
#
# Looking at RetrieveRequest's generate_class_params, you'll see quite a few of these parameters are common to all
# Retrieve calls and therefore are captured here.  This includes class, pgsize, pgnum, format, sort, style, language
# and biblist.  Defaults have been provided when possible, and are the same as the ones defined by the API spec.  NOTE:
# Here you can also see where the client deviates from the spec.  For example, you can see that the style parameter is
# simply hard-coded to 0, and any value passed-in will be ignored.
#
# We still have not accounted for method, search or folder.  Looking at RetrieveAuthorRequest's generate_request_info,
# we find the three remaining parameters.  These are defined here because search and folder are not common to all
# Retrieve requests, and of course the value for method is going to be unique to each method.

# API method call cheat sheet below.  There's probably not 100% coverage, but here's most of 'em.

pp rwc.sess

response = rwc.request('retrieve', 'quick', {
                         :search => "Jones",
                       }
)

#response = rwc.request(
#    'retrieve',
#    'advancesearch',
#    {
#        :parameter_list => [
#            {field: "ALLAU", search: "Jones"},
##            {connector: 'and', field: "T1", search: "Education"}
#        ],
#        :classic => 'true',
#        :pgnum => 1,
#        :pgsize => 20
#    }
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'all',
#                       :method_params => {},
#)

#response = rwc.request('retrieve', 'author', {:search => "Rhode,Paul W.", :folder => 'testfolder'})

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'periodical',
#                       :method_params => {:search => "Family and Marriage"},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'byid',
#                       :method_params => {:id => [42154, 42160, 42400]},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'dup',
#                       :method_params => {:search => 'close'},
#)

#response = rwc.request('retrieve', 'folder',
#                       :method_params => {:search => 'Pending'},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'modsince',
#                       :method_params => {:search => '999999999999'},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'nofolder',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'saved',
#                       :method_params => {:saved => 'fransearch', :classic => 'true'},
#)

#response = rwc.request(:class_name => 'retrieve',
#                       :method_name => 'specialfolder',
#                       :method_params => {:search => 'deleted'},
#)

#response = rwc.request(:class_name => 'authentication',
#                   :method_name => 'userexists',
#                   :method_params => {
#                       :login_name => "nouser",
#                       :group_code => rwc.group_code,
#                       :password => rwc.password,
#                   }
#)

#response = rwc.request(:class_name => 'authentication',
#                       :method_name => 'newtempusersess',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'authors',
#                       :method_name => 'all',
#                       :method_params => {},
#)


#response = rwc.request(:class_name => 'authors',
#                       :method_name => 'search',
#                       :method_params => {:search => 'Smith'},
#)


#response = rwc.request(:class_name => 'descriptors',
#                       :method_name => 'all',
#                       :method_params => {},
#)


#response = rwc.request(:class_name => 'descriptors',
#                       :method_name => 'search',
#                       :method_params => {:search => '%Segregation%'},
#)


#response = rwc.request(:class_name => 'periodicals',
#                       :method_name => 'all',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'periodicals',
#                       :method_name => 'search',
#                       :method_params => {:search => 'Am'},
#)

#response = rwc.request(:class_name => 'folders',
#                       :method_name => 'all',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'folders',
#                       :method_name => 'search',
#                       :method_params => {:search => 'test'},
#)

#response = rwc.request(:class_name => 'importfilter',
#                       :method_name => 'allavailable',
#                       :method_params => {:includedb => 'true'},
#)

#response = rwc.request(:class_name => 'importfilter',
#                       :method_name => 'allglobal',
#                       :method_params => {:includedb => 'true'},
#)

#response = rwc.request(:class_name => 'importfilter',
#                       :method_name => 'favorites',
#                       :method_params => {:includedb => 'false'},
#)

#response = rwc.request(:class_name => 'importfilter',
#                       :method_name => 'search',
#                       :method_params => {:includedb => 'false', :search => 'MED'},
#)

#response = rwc.request('manuscript',
#                       'baseurl',
#                       {:methodname => 'text',},
#)

#manuscript_baseurl = response.baseurl
#pp "BASE URL IS " + response.baseurl

#response = rwc.request(:class_name => 'manuscript',
#                       :method_name => 'all',
#                       :base_url => manuscript_baseurl,
#                       :method_params => {:id => 1, :fileformat => 'text', :maxrefs => 3,
#    },
#)

#response = rwc.request('manuscript',
#                       'byid',
#                       {:base_url => "http://as.refworks.com/accessrw/", :id => 1, :ids => [41500], :fileformat => 'text',
#                       },
#)

#response = rwc.request(:class_name => 'manuscript',
#                       :method_name => 'mylist',
#                       :base_url => manuscript_baseurl,
#                       :method_params => {:id => 1, :folder => 'testfolder', :fileformat => 'word',
#                       },
#)
#filetoken = response.filetoken

#response = rwc.request(:class_name => 'manuscript',
#                       :method_name => 'file',
#                       :base_url => manuscript_baseurl,
#                       :method_params => {:filetoken => filetoken,
#                       },
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'encoding',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'fieldlabels',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'sourcetypes',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'typelabels',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'languages',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'outputlanguage',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'properties',
#                       :method_name => 'sortlocales',
#                       :method_params => {},
#)

#response = rwc.request(:class_name => 'reference',
#                       :method_name => 'get',
#                       :method_params => {:id => [46400]},
#)


#response = rwc.request(:class_name => 'savedsearch',
#                       :method_name => 'all',
#                       :method_params => {},
#)

#response = rwc.request('savedsearch', 'get', {:saved => 'fransearch'})

#response = rwc.request('retrieve', 'folder',
#                       {:search => 'TestData'},
#)
#refs = response.references
#response = rwc.request('reference','add',{:references => refs, :folder => 'Pending', :returnrefs => '1'})

#response = rwc.request('reference','addcomment',{:id => 46868, :comments => [{:title => "New Comment", :name => "Joe User", :inetinfo => "www.cnn.com", :comment => "This is a sample comment."}]})

#response = rwc.request('reference','delete',{:ids => [46868,46869]})

#response = rwc.request('retrieve', 'folder', {:search => 'Pending'},
#)
#refs = response.references
#refs.each { |ref|
#  title = ref.title
#  title << " - EDITING"
#  ref.title = title
#}
#response = rwc.request('reference','edit',{:references => refs})

#response = rwc.request('reference','addcomment',{:id => 46868, :comments => [{:title => "New Comment", :name => "Joe User", :inetinfo => "www.cnn.com", :comment => "This is a sample comment."}]})


if response.result_code == "200"
  #pp "Received " + response.total_hits + " hits, " + response.total_returned + " of which were returned."
  #pp response.filetoken
  #pp response.reftypes
  #pp response.outputlanguages
  #pp response.sortlocales
  #pp response.sourcetypes
  #pp response.typelabels
  #pp response.references
  #pp response.savedsearches
else
#  pp references
#  pp response.result_code.class
#  pp response.result_msg
end

response.references.each { |ref| puts ref.to_refworks_xml}

#pp response.body
#pp response.parsed_response

