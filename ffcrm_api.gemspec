$:.push File.expand_path("../lib", __FILE__)

require "ffcrm_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ffcrm_api"
  s.version     = FfcrmApi::VERSION
  s.authors     = ["Steve Kenworthy"]
  s.email       = ["steveyken@gmail.com"]
  s.homepage    = "http://www.fatfreecrm.com"
  s.summary     = "Provides an API for Fat Free CRM"
  s.description = "A sandpit to help develop an API for Fat Free CRM. This is unstable code."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "fat_free_crm"
  s.add_dependency "active_model_serializers"
  s.add_development_dependency "pg"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
end
