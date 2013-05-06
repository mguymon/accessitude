# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "accessitude/version"

Gem::Specification.new do |s|
  s.name          = %q{accessitude}
  s.license       = "MIT"
  s.version       = Accessitude::VERSION
  s.platform      = Gem::Platform::RUBY
  s.homepage      = %q{https://github.com/mguymon/accessitude}
  s.authors       = ["Michael Guymon"]
  s.email         = ["mguymon@tobedevoured.com"]
  s.description   = %q{Accessitude}
  s.summary       = %q{Accessitude}

  s.files         = `git ls-files`.split("\n").sort
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency(%q<activerecord>, ["> 3.0.0"])
  s.add_development_dependency(%q<rspec>, ["~> 2.12.0"])
  s.add_development_dependency(%q<sqlite3>, ["~> 1.3.0"])
  s.add_development_dependency(%q<yard>, ["~> 0.8.0"])
end