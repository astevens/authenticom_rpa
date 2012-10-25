# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'authenticom_rpa/version'

Gem::Specification.new do |gem|
  gem.name          = "authenticom_rpa"
  gem.version       = AuthenticomRpa::VERSION
  gem.authors       = ["Andrew Stevens"]
  gem.email         = ["andy@orangesix.com"]
  gem.description   = %q{Authenticom RPA client}
  gem.summary       = %q{Connects to the authenticom Reverse Phone Append SOAP service}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "savon"
end
