require "rspec_sidecar_generators/version"
require "rspec_sidecar_generators/engine"

module RspecSidecarGenerators
  # Your code goes here...
  class Railtie < ::Rails::Railtie
    generators = config.app_generators
    generators.test_framework :rspec_sidecar_generators

    generators.fallbacks[:rspec_sidecar_generators] = :rspec
  end
end
