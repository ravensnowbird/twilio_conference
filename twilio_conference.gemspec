$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "twilio_conference/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "twilio_conference"
  s.version     = TwilioConference::VERSION
  s.authors     = ["Vivek"]
  s.email       = ["ravensnowbird@gmail.com"]
  s.summary     = "Summary of TwilioConference."
  s.description = "Description of TwilioConference."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "twilio-ruby"

end
