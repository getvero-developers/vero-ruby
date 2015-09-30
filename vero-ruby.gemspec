# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vero/ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "vero-ruby"
  spec.version       = Vero::VERSION
  spec.authors       = ["Damien Brzoska", "James Lamont"]
  spec.email         = ["damien@getvero.com", "james@getvero.com"]

  spec.summary       = "Ruby client for Vero API."
  spec.description   = "Ruby client for Vero API."
  spec.homepage      = "https://developers.getvero.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "mocha", "~> 0.13.2"
  spec.add_development_dependency "shoulda", "~> 3.4.0"
  spec.add_development_dependency "test-unit"
end
