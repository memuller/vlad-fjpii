# -*- encoding: utf-8 -*-
require File.expand_path('../lib/vlad/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matheus E. Muller"]
  gem.email         = ["hello@memuller.com"]
  gem.description   = %q{Vlad deployment recipes used on João Paulo II Foundation.}
  gem.summary       = %q{Builds and symlinks config files, public folders, and aggregates common recipes.}
  gem.homepage      = ""

  gem.add_dependency("vlad", ["~> 2.3.0"])
  gem.add_dependency("hoe")
  gem.add_dependency("vlad-git")

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "vlad-fjpii"
  gem.require_paths = ["lib"]
  gem.version       = Vlad::FJPII::VERSION

end
