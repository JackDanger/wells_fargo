# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wells_fargo/version"

Gem::Specification.new do |s|
  s.name        = "wells_fargo"
  s.version     = WellsFargo::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jack Danger Canty"]
  s.email       = ["rubygems@6brand.com"]
  s.homepage    = "http://github.com/JackDanger/wells_fargo"
  s.summary     = %q{Client for the Wells Fargo Payment Manager service}
  s.description = %q{Outsource your check writing and other payment services to Wells Fargo's API via this Ruby client.}

  s.rubyforge_project = "wells_fargo"

  s.add_dependency 'builder'
  s.add_development_dependency 'shoulda'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
