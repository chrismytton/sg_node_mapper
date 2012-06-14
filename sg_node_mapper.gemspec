# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sg_node_mapper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Mytton"]
  gem.email         = ["self@hecticjeff.net"]
  gem.description   = %q{Map social networking sites' URLs to and from a canonical form.}
  gem.summary       = %q{The Social Graph Node Mapper is a community project to build a portable library to map social networking sites' URLs to and from a canonical form (sgn:// URLs).}
  gem.homepage      = "https://github.com/hecticjeff/sg_node_mapper"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sg_node_mapper"
  gem.require_paths = ["lib"]
  gem.version       = SgNodeMapper::VERSION

  gem.add_dependency 'execjs', '>= 1.4'
  gem.add_dependency 'activesupport', '>= 3.0'

  gem.add_development_dependency 'rake', '>= 0.9'
end
