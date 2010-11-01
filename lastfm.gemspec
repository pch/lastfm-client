# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lastfm/version"

Gem::Specification.new do |s|
  s.name        = "lastfm"
  s.version     = LastFM::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Piotr Chmolowski"]
  s.email       = ["piotr@chmolowski.pl"]
  s.homepage    = "http://github.com/pch/lastfm"
  s.summary     = "Last.fm API client"
  s.description = "Last.fm API client"

  #s.rubyforge_project = "lastfm"

  s.add_dependency "json", "~> 1.4.6"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
