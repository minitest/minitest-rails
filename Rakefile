# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :git
Hoe.plugins.delete :rubyforge

Hoe.spec 'minitest-rails' do
  developer 'Mike Moore', 'mike@blowmage.com'

  self.summary     = 'MiniTest integration for Rails 3.'
  self.description = 'Adds MiniTest as the default testing library in Rails 3.'
  self.url         = 'http://blowmage.com/minitest-rails'

  self.history_file = "CHANGELOG.rdoc"
  self.readme_file  = "README.rdoc"
  self.testlib      = :minitest

  extra_deps << ['minitest',  '~> 2.11']
  extra_deps << ['rails',     '~> 3.1']
end

# vim: syntax=ruby
