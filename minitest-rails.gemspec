require File.expand_path("lib/minitest/rails/version", __dir__)

Gem::Specification.new do |gem|
  gem.name          = "minitest-rails"
  gem.version       = Minitest::Rails::VERSION

  gem.authors       = ["Mike Moore"]
  gem.email         = ["mike@blowmage.com"]
  gem.description   = "Adds Minitest as the default testing library in Rails"
  gem.summary       = "Minitest integration for Rails"
  gem.homepage      = "http://minitest.github.io/minitest-rails/"
  gem.license       = "MIT"

  gem.files         = `git ls-files -- lib/*`.split("\n") +
                      ["README.md", "UPDATING.md", "CHANGELOG.md", "LICENSE"]
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 3.1"

  gem.add_dependency "minitest", "~> 5.20"
  gem.add_dependency "railties", ">= 7.2.0", "< 8.0.0"

  gem.add_development_dependency "minitest-autotest", "~> 1.1"
  gem.add_development_dependency "minitest-focus", "~> 1.4"
  gem.add_development_dependency "minitest-rg", "~> 5.2"
  gem.add_development_dependency "rdoc", "~> 6.5"
  gem.add_development_dependency "rubocop", "~> 1.57.0"
  gem.metadata["rubygems_mfa_required"] = "true"
end
