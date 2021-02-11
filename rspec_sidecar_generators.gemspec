require_relative "lib/rspec_sidecar_generators/version"

Gem::Specification.new do |spec|
  spec.name        = "rspec_sidecar_generators"
  spec.version     = RspecSidecarGenerators::VERSION
  spec.authors     = ["Yiannis Skarpathiotis"]
  spec.email       = ["yiannis@secondcitywebsites.com"]
  spec.homepage    = "https://scwd.co"
  spec.summary     = "Summary of RspecSidecarGenerators."
  spec.description = "Description of RspecSidecarGenerators."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.2", ">= 6.1.2.1"
  spec.add_dependency "rspec-rails", "~> 4.0.0"
end
