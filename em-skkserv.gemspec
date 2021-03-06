# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'em-skkserv/version'

Gem::Specification.new do |spec|
  spec.name          = "em-skkserv"
  spec.version       = EventMachine::SKKServ::VERSION
  spec.authors       = ["shunirr"]
  spec.email         = ["m@s5r.jp"]
  spec.description   = %q{EventMachine based SKKServ}
  spec.summary       = %q{EventMachine based SKKServ}
  spec.homepage      = "https://github.com/shunirr/em-skkserv-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "eventmachine"
end
