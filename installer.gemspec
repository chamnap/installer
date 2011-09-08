# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "installer/version"

Gem::Specification.new do |s|
  s.name        = "installer"
  s.version     = Installer::VERSION
  s.authors     = ["Chamnap"]
  s.email       = ["chamnapchhorn@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A collection of installation rake scripts}
  s.description = %q{A tool that makes it easy to install any popular softwares eg. mongodb,nginx,solr,...}

  s.rubyforge_project = "installer"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  #s.add_runtime_dependency "rest-client"
end
