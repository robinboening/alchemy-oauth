$:.push File.expand_path("../lib", __FILE__)

require "alchemy/oauth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "alchemy-oauth"
  s.version     = Alchemy::Oauth::VERSION
  s.authors     = ["Pascal Jungblut"]
  s.email       = ["gem@pascalj.de"]
  s.homepage    = "http://magiclabs.de"
  s.summary     = "Alchemy OAuth provider."
  s.description = "Enables simple login for Alchemy users via OAuth 2.0."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "alchemy_cms"
  s.add_dependency "doorkeeper"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"

end
