# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :git
Hoe.plugin :gemspec
Hoe.plugin :travis
Hoe.plugins.delete :rubyforge

Hoe.spec 'minitest-rails' do
  developer 'Mike Moore', 'mike@blowmage.com'

  self.summary     = 'MiniTest integration for Rails 3 and 4'
  self.description = 'Adds MiniTest as the default testing library in Rails 3 and 4'
  self.urls        = ['http://blowmage.com/minitest-rails']

  self.history_file = "CHANGELOG.rdoc"
  self.readme_file  = "README.rdoc"
  self.testlib      = :minitest

  dependency 'minitest',  '~> 4.7'
  dependency 'rails',     '>= 3.0'
  dependency 'fakefs',    '~> 0.4', :dev
end

Dir["tasks/**/*.rake"].each { |t| load t }

# vim: syntax=ruby
