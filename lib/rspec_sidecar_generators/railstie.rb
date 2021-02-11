module RspecSidecarGenerators
  # Your code goes here...
  class Railtie < ::Rails::Railtie
    initializer "rspec_sidecar_generators.set_test_framework_replacement" do
      generators = config.app_generators
      generators.test_framework :rspec_sidecar_generators

      generators.fallbacks[:rspec_sidecar_generators] = :rspec
    end
  end
end
