# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :git
Hoe.plugin :gemspec
Hoe.plugin :travis
Hoe.plugins.delete :rubyforge

Hoe.spec 'minitest-rails' do
  developer 'Mike Moore', 'mike@blowmage.com'

  self.summary     = 'MiniTest integration for Rails 3.x'
  self.description = 'Adds MiniTest as the default testing library in Rails 3.x'
  self.urls        = ['http://blowmage.com/minitest-rails']

  self.history_file = "CHANGELOG.rdoc"
  self.readme_file  = "README.rdoc"
  self.testlib      = :minitest

  dependency 'minitest',  '~> 3.4'
  dependency 'rails',     '~> 3.0'
  dependency 'fakefs',    '~> 0.4', :dev
end

namespace :gemfiles do
  desc "Updates the gemfiles"
  task :update do
    `bundle --gemfile=gemfiles/3.0.gemfile`
    `bundle --gemfile=gemfiles/3.1.gemfile`
    `bundle --gemfile=gemfiles/3.2.gemfile`
  end
  desc "Clear the lock gemfiles"
  task :clear do
    `rm gemfiles/3.*.gemfile.lock`
  end
end

Rake::Task["gem:spec"].enhance do
  Rake::Task["gemfiles:update"].invoke
end

# vim: syntax=ruby
