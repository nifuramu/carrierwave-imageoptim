# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave-imageoptim/version'

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-imageoptim"
  spec.version       = CarrierWave::ImageOptim::VERSION
  spec.authors       = ["nifuramu"]
  spec.email         = ["nozzzzz@gmail.com"]

  spec.summary       = %q{A simple image optimizer for CarrierWave via image_optim}
  spec.description   = %q{Simply optimize CarrierWave images via image_optim}
  spec.homepage      = "http://github.com/nifuramu/#{spec.name}"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "carrierwave", ">= 0.10", "< 1.2"
  spec.add_runtime_dependency 'image_optim', '~> 0.22'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "mini_magick", ">= 3.6.0"
end
