# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'discourse_sso/version'

Gem::Specification.new do |spec|
  spec.name          = "discourse-sso-rails"
  spec.version       = DiscourseSSO::VERSION
  spec.authors       = ["Egor Vorobiev"]
  spec.email         = ["vorobievegoralexandrovich@gmail.com"]

  spec.summary       = %q{Simple integration with discourse sso}
  spec.homepage      = "https://github.com/Vorob-Astronaut/discourse-sso-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
