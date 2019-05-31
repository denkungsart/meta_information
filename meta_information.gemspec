$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "meta_information/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "meta_information"
  spec.version     = MetaInformation::VERSION
  spec.authors     = ["Fabian Schwahn"]
  spec.email       = ["fabian.schwahn@gmail.com"]
  spec.homepage    = "https://github.com/denkungsart/meta_information"
  spec.summary     = "Adds model to save meta information for other models."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://gems.denkungsart-gmbh.de/private"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.1"

  spec.add_development_dependency "combustion"
  spec.add_development_dependency "sqlite3"
end
