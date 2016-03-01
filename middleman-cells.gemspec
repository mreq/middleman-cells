# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'middleman-cells/version'

Gem::Specification.new do |s|
  s.name        = 'middleman-cells'
  s.version     = Middleman::Cells::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['notozeki']
  s.email       = ['notozeki@gmail.com']
  s.summary     = %q{Cells support for Middleman.}
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'middleman-core', '~> 4.0'
  s.add_runtime_dependency 'cells', '~> 4.0.0'

  s.add_development_dependency 'cells-erb'
end
