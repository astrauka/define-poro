# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'define-poro/version'

Gem::Specification.new do |spec|
  spec.name          = 'define-poro'
  spec.version       = DefinePoro::VERSION
  spec.authors       = ['Karolis Astrauka']
  spec.email         = ['astrauka@gmail.com']
  spec.summary       = %q{Plain Old Ruby Object class builder from provided attribute list.}
  spec.description   = %q{Provides dynamic class builder given attributes that the ruby object
    should take and class definition block.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.10'
end
