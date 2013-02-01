require File.expand_path("../lib/refworks/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "refworks"
  s.version     = Refworks::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Fran Fabrizio"]
  s.email       = ["fran@umn.edu"]
  s.homepage    = "http://github.umn.edu/fran/refworks-api-ruby"
  s.summary     = "A Ruby interface to the RefWorks API."
  s.description = "A Ruby interface to the RefWorks API, implementing a subset of the API (see README for specifics)."

  s.required_rubygems_version = ">= 1.3.6"

  # lol - required for validation
  s.rubyforge_project         = "refworks"

  # If you have other dependencies, add them here
  s.add_dependency "httparty", ">= 0.10.2"

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", "LICENSE", "*.md"]
  s.require_path = 'lib'

  # If you need an executable, add it here
  # s.executables = ["newgem"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"
end