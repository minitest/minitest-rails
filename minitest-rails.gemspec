require File.expand_path("lib/minitest/rails/version", __dir__)

Gem::Specification.new do |gem|
  gem.name          = "minitest-rails"
  gem.version       = Minitest::Rails::VERSION

  gem.authors       = ["Mike Moore"]
  gem.email         = ["mike@blowmage.com"]
  gem.description   = "Adds Minitest as the default testing library in Rails"
  gem.summary       = "Minitest integration for Rails"
  gem.homepage      = "http://blowmage.com/minitest-rails"
  gem.license       = "MIT"

  gem.files         = `git ls-files -- lib/*`.split("\n") +
                      ["README.md", "UPDATING.md", "CHANGELOG.md", "LICENSE"]
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 2.5.0"

  gem.add_dependency "minitest", "~> 5.10"
  gem.add_dependency "railties", "~> 6.1.0"

  gem.add_development_dependency "minitest-autotest", "~> 1.0"
  gem.add_development_dependency "minitest-focus", "~> 1.1"
  gem.add_development_dependency "minitest-rg", "~> 5.2"
  gem.add_development_dependency "rdoc", "~> 6.0"
  gem.add_development_dependency "rubocop", "~> 0.64.0"
end
