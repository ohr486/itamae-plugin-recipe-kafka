# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "itamae/plugin/recipe/kafka/version"

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-kafka"
  spec.version       = Itamae::Plugin::Recipe::Kafka::VERSION
  spec.authors       = ["ohr486"]
  spec.email         = ["ohr486@gmail.com"]

  spec.summary       = %q{Itamae plugin to install kafka}
  spec.description   = %q{Itamae plugin to install kafka}
  spec.homepage      = "https://github.com/ohr486/itamae-plugin-recipe-kafka"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "itamae", "~> 1.2"
  spec.add_dependency "itamae-plugin-recipe-scala", "~> 0.0.1"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "serverspec"
end
