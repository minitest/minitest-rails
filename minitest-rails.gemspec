# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "minitest-rails"
  s.version = "0.9.2.20130623200248"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Moore"]
  s.date = "2013-06-24"
  s.description = "Adds MiniTest as the default testing library in Rails 3 and 4"
  s.email = ["mike@blowmage.com"]
  s.summary = "MiniTest integration for Rails 3 and 4"
  s.homepage = "http://blowmage.com/minitest-rails"
  
  s.rubyforge_project = "minitest-rails"
  s.rubygems_version = "2.0.3"
  s.require_path = "lib"
  s.test_files = `git ls-files -- test/**/**`.split("\n")
  s.files = `git ls-files`.split("\n") 
  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc"]
  
  s.specification_version = 4 if s.respond_to?(:specification_version)

  s.add_dependency("minitest", "~> 4.7")
  s.add_dependency("railties", ">= 3.0")
  s.add_dependency("rdoc", "~> 4.0")
  s.add_dependency("fakefs", "~> 0.4")
  s.add_dependency("hoe", "~> 3.6")
end
