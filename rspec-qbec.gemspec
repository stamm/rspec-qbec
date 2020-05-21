lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/qbec/version'

Gem::Specification.new do |spec|
  spec.name    = 'rspec-qbec'
  spec.version = RSpec::Qbec.version

  spec.authors = ['Rustam Zagirov']
  spec.email = 'stammru@gmail.com'

  spec.summary     = 'Helpers for qbec run'
  spec.description = 'RSpec::Wait enables time-resilient expectations in your RSpec test suite.' # rubocop:disable Metrics/LineLength
  spec.homepage    = 'https://github.com/stamm/rspec-qbec'
  spec.license     = 'MIT'

  spec.files      = `git ls-files -z`.split("\x0")
  spec.test_files = spec.files.grep(/^spec/)

  spec.require_paths = ['lib']


  spec.add_runtime_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
