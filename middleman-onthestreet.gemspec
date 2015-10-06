# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-onthestreet"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dan Nguyen"]
  s.email       = ["dan@danwin.com"]
  s.homepage    = "http://github.com/dannguyen/onthestreet"
  s.summary     = "Some helpers for Middleman"
  s.description = "Whats up"
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency 'middleman-core', '~> 3.3', '>= 3.3.12'

  # extrastuff
#  s.add_runtime_dependency 'bootstrap-sass', '~> 3.3', '>= 3.3.5'
  s.add_runtime_dependency 'chronic', '~>0.10', '>= 0.10.2'
  s.add_runtime_dependency 'middleman-pry', '~>0.0', '>= 0.0.4'
  s.add_runtime_dependency 'middleman-s3_sync', '~>3.0', '>= 3.0.42'
  s.add_runtime_dependency 'middleman-syntax', '~>2.0', '>= 2.0.0'

  # Additional dependencies

  # s.add_runtime_dependency("gem-name", "gem-version")
end
