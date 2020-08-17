$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "qbo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "qbo"
  spec.version     = Qbo::VERSION
  spec.authors     = ["Dan Thomas"]
  spec.email       = ["dan@ideacrew.com"]
  spec.homepage    = "https://ideacrew.com"
  spec.summary     = "Engine for interfacing with QuickBooks Online"
  spec.description = "Engine for interfacing with QuickBooks Online"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.2"

  # gem for integrating with QuickBooks Online
  spec.add_dependency 'qbo_api'
  spec.add_dependency 'typhoeus',       '~> 1.4'
  spec.add_dependency 'simple_form',    '~> 5.0'

  spec.add_dependency 'dry-validation', '~> 1.5'
  spec.add_dependency 'dry-struct',     '~> 1.0'
  spec.add_dependency 'dry-monads',     '~> 1.3'
  spec.add_dependency 'dry-matcher',    '~> 0.8'

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency 'rspec-rails', '~> 4.0.0'
  spec.add_development_dependency 'json_spec'
  spec.add_development_dependency 'database_cleaner-active_record'
  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'yard', '~> 0.9'
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency 'pry-byebug'
end
