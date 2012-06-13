# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sg_node_mapper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Mytton"]
  gem.email         = ["self@hecticjeff.net"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sg_node_mapper"
  gem.require_paths = ["lib"]
  gem.version       = SgNodeMapper::VERSION

  gem.add_dependency 'execjs', '>= 1.4'
  gem.add_dependency 'activesupport', '>= 3.0'
end
