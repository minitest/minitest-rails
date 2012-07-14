# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :git
Hoe.plugin :gemspec
Hoe.plugins.delete :rubyforge

Hoe.spec 'minitest-rails' do
  developer 'Mike Moore', 'mike@blowmage.com'

  self.summary     = 'MiniTest integration for Rails 3.x'
  self.description = 'Adds MiniTest as the default testing library in Rails 3.x'
  self.urls        = ['http://blowmage.com/minitest-rails']

  self.history_file = "CHANGELOG.rdoc"
  self.readme_file  = "README.rdoc"
  self.testlib      = :minitest

  extra_deps << ['minitest',  '~> 3.0']
  extra_deps << ['rails',     '~> 3.0']
end

# vim: syntax=ruby
