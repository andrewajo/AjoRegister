$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ajo_register/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ajo_register"
  s.version     = AjoRegister::VERSION
  s.authors     = ["Andrew Joe"]
  s.email       = ["andrew@ajoconsulting.com"]
  s.homepage    = "http://www.ajoconsulting.com"
  s.summary     = "simple registration engine"
  s.description = "simple registration engine"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_dependency "thin"
  s.add_dependency "haml"
  s.add_dependency "bcrypt-ruby"
  s.add_dependency "devise"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "pg"
end
