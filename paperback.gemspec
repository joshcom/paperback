# -*- encoding: utf-8 -*-
require File.expand_path('../lib/paperback/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joshua Murray"]
  gem.email         = ["joshua.murray@gmail.com"]
  gem.description   = %q{An API client for goodreads.}
  gem.summary       = %q{An API client for goodreads.}
  gem.homepage      = "http://github.com/joshcom/paperback"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "paperback"
  gem.require_paths = ["lib"]
  gem.version       = Paperback::VERSION

  gem.add_dependency "faraday"
  gem.add_dependency "addressable"
  gem.add_dependency "json"
  gem.add_development_dependency "rspec", "~> 2.11"
  gem.add_development_dependency "rake", "~> 0.9.2"
  gem.add_development_dependency "webmock"
end
