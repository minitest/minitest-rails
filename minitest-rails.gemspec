# -*- encoding: utf-8 -*-
require 'rake'
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'minitest/rails/version'

Gem::Specification.new do |s|
  s.name        = 'minitest-rails'
  s.version     = MiniTest::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Mike Moore']
  s.email       = 'mike@blowmage.com'
  s.homepage    = 'http://github.com/blowmage/minitest-rails'
  s.summary     = 'minitest-rails-#{MiniTest::Rails::VERSION}'
  s.description = 'MiniTest integration for Rails 3.1.'

  s.required_ruby_version     = '>= 1.8.7'
  s.required_rubygems_version = ">= 1.3.6"

  s.files            = FileList['lib/**/*', '[A-Z]*', 'test/**/*'].to_a
  s.test_files       = FileList['test/**/*'].to_a
  s.extra_rdoc_files = ['README.md']
  s.rdoc_options     = ['--charset=UTF-8']
  s.require_path     = 'lib'

  s.add_runtime_dependency('minitest',      ['~> 2.0'])
  s.add_runtime_dependency('activesupport', ['~> 3.0'])
  s.add_runtime_dependency('actionpack',    ['~> 3.0'])
  s.add_runtime_dependency('railties',      ['~> 3.0'])
end

