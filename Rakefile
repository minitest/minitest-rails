# -*- ruby -*-

require "rubygems"
require "hoe"

Hoe.plugin :git
Hoe.plugin :gemspec

Hoe.spec "minitest-rails" do
  developer "Mike Moore", "mike@blowmage.com"

  self.summary     = "Minitest integration for Rails"
  self.description = "Adds Minitest as the default testing library in Rails"
  self.urls        = ["http://blowmage.com/minitest-rails"]

  self.history_file = "CHANGELOG.rdoc"
  self.readme_file  = "README.rdoc"
  self.testlib      = :minitest

  license "MIT"

  dependency "minitest",          "~> 5.10"
  dependency "railties",          "~> 6.0.0.beta1"
  dependency "minitest-autotest", "~> 1.0",  :dev
  dependency "minitest-focus",    "~> 1.1",  :dev
  dependency "minitest-rg",       "~> 5.2",  :dev
end

Dir["tasks/**/*.rake"].each { |t| load t }

# vim: syntax=ruby
