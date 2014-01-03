require File.expand_path("../lib/refworks/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "refworks"
  s.version     = Refworks::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Fran Fabrizio"]
  s.email       = ["fran@umn.edu"]
  s.homepage    = "http://github.umn.edu/mpc/refworks-api-ruby"
  s.summary     = "A Ruby interface to the RefWorks API."
  s.description = "A Ruby interface to the RefWorks API, implementing a subset of the API (see README for specifics)."

  # This is driven by the use of strict_encode64 in the method Request::generate_signature.
  # See that method for documentation regarding a workaround to make this gem work under Ruby 1.8.
  s.required_ruby_version = '>= 1.9.2'

  s.required_rubygems_version = ">= 1.3.6"

  # lol - required for validation
  s.rubyforge_project         = "refworks"

  # If you have other dependencies, add them here
  s.add_dependency "httparty", ">= 0.10.2"
  s.add_dependency "require_all"
  s.add_dependency "mash"

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", "LICENSE", "*.md"]
  s.require_path = 'lib'

  # If you need an executable, add it here
  # s.executables = ["newgem"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"
end
