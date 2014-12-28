$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shiftly/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shiftly"
  s.version     = Shiftly::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Alek Niemczyk']
  s.email       = ['alek@rubylogic.pl']
  s.homepage    = 'https://github.com/logicorg/shiftly'
  s.summary     = 'Factory shift methods collection'
  s.description = 'Factory shift methods collection'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'business_time'

  s.add_development_dependency 'rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
end
