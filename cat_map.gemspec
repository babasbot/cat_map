# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cat_map/version'

Gem::Specification.new do |spec|
  spec.name          = "cat_map"
  spec.version       = CatMap::VERSION
  spec.authors       = ["Luis Alfredo Lorenzo"]
  spec.email         = ["babasbot@gmail.com"]

  spec.summary       = "An Arnold's cat map ruby implementation."
  spec.description   = "In mathematics, Arnold's cat map is a chaotic map from the torus into itself, named after Vladimir Arnold, who demonstrated its effects in the 1960s using an image of a cat, hence the name."
  spec.homepage      = "https://github.com/babasbot/cat_map"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("chunky_png", "~> 1.3")
  spec.add_dependency("thor", "~> 0.19")

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
