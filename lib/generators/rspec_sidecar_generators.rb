require "rspec_sidecar_generators/helpers"

module RspecSidecarGenerators
  class Base < Rails::Generators::NamedBase
    include RspecSidecarGenerators::Helpers
    def self.source_root(path = nil)
			if path
				@_rspec_source_root = path
			else
				@_rspec_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'rspec_sidecar_generators', generator_name, 'templates'))
			end
		end
  end
end
