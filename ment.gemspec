# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ment'

Gem::Specification.new do |spec|
  spec.name          = 'ment'
  spec.version       = Ment::VERSION
  spec.authors       = ['Patricio Mac Adden']
  spec.email         = ['patriciomacadden@gmail.com']
  spec.summary       = %q{(environ)ment adds methods for asking what's the value of RACK_ENV.}
  spec.description   = %q{(environ)ment adds methods for asking what's the value of RACK_ENV.}
  spec.homepage      = 'https://github.com/patriciomacadden/ment'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'cuba'
  spec.add_development_dependency 'hobbit'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'oktobertest'
  spec.add_development_dependency 'oktobertest-contrib'
end
