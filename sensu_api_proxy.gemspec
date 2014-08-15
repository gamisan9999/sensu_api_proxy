# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sensu_api_proxy/version'

Gem::Specification.new do |spec|
  spec.name          = "sensu_api_proxy"
  spec.version       = SensuAPIProxy::VERSION
  spec.authors       = ["y13i"]
  spec.email         = ["email@y13i.com"]
  spec.summary       = %q{Sensu API proxy.}
  spec.description   = %q{Proxy server for Sensu API. Can intercept returned values.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_dependency "sinatra"
  spec.add_dependency "puma"

  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "sinatra-reloader"
end
