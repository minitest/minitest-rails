# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :git
Hoe.plugins.delete :rubyforge

Hoe.spec 'minitest-rails' do
  developer 'Mike Moore', 'mike@blowmage.com'

  self.summary     = 'MiniTest integration for Rails 3.1.'
  self.description = 'Adds MiniTest as the default testing library in Rails.'
  self.url         = 'http://blowmage.com/minitest-rails'

  self.history_file = "CHANGELOG.rdoc"
  self.readme_file  = "README.rdoc"
  self.testlib      = :minitest

  extra_deps << ['minitest',      '~> 2.2']
  extra_deps << ['railties',      '~> 3.1.0.rc1']
  extra_deps << ['activesupport', '~> 3.1.0.rc1']
  extra_deps << ['actionpack',    '~> 3.1.0.rc1']
end

# vim: syntax=ruby
