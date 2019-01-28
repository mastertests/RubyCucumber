lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'RubyCucumber/version'

Gem::Specification.new do |spec|
  spec.name          = 'RubyCucumber'
  spec.version       = RubyCucumber::VERSION
  spec.authors       = ['Nazar']
  spec.email         = ['nazar.potykan@gmail.com']

  spec.summary       = 'Ruby Cucumber tests'

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0.a'
  spec.add_development_dependency 'rake', '~> 10.0'
end
