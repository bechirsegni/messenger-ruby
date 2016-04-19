# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'messenger/version'

Gem::Specification.new do |spec|
  spec.name          = "messenger-ruby"
  spec.version       = Messenger::VERSION
  spec.authors       = ["justynjozwiak", "mejcz"]
  spec.email         = ["justyn.jozwiak@netguru.pl", "magda.wisniewska@netguru.co"]

  spec.summary       = 'A simple library for supporting implementation of Facebook Messenger Bots.'
  spec.homepage      = 'https://github.com/netguru/messenger-ruby'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rest-client'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "codeclimate-test-reporter"
end
