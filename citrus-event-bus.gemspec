# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'citrus/event_bus/version'

Gem::Specification.new do |spec|
  spec.name          = "citrus-event-bus"
  spec.version       = Citrus::EventBus::VERSION
  spec.authors       = ["Paweł Pacana"]
  spec.email         = ["pawel.pacana@gmail.com"]
  spec.summary       = %q{Event bus adapter for Citrus.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "poseidon", "0.0.4"
end
