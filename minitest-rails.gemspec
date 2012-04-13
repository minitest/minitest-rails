# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "minitest-rails"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Moore"]
  s.date = "2012-03-14"
  s.description = "Adds MiniTest as the default testing library in Rails 3."
  s.email = ["mike@blowmage.com"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc"]
  s.files = [".autotest", "CHANGELOG.rdoc", "Manifest.txt", "README.rdoc", "Rakefile", "lib/generators/mini_test.rb", "lib/generators/mini_test/controller/controller_generator.rb", "lib/generators/mini_test/controller/templates/controller_spec.rb", "lib/generators/mini_test/controller/templates/controller_test.rb", "lib/generators/mini_test/helper/helper_generator.rb", "lib/generators/mini_test/helper/templates/helper_spec.rb", "lib/generators/mini_test/helper/templates/helper_test.rb", "lib/generators/mini_test/install/install_generator.rb", "lib/generators/mini_test/install/templates/test/minitest_helper.rb", "lib/generators/mini_test/mailer/mailer_generator.rb", "lib/generators/mini_test/mailer/templates/mailer_spec.rb", "lib/generators/mini_test/mailer/templates/mailer_test.rb", "lib/generators/mini_test/model/model_generator.rb", "lib/generators/mini_test/model/templates/fixtures.yml", "lib/generators/mini_test/model/templates/model_spec.rb", "lib/generators/mini_test/model/templates/model_test.rb", "lib/generators/mini_test/scaffold/scaffold_generator.rb", "lib/generators/mini_test/scaffold/templates/controller_spec.rb", "lib/generators/mini_test/scaffold/templates/controller_test.rb", "lib/minitest-rails.rb", "lib/minitest/rails.rb", "lib/minitest/rails/controller.rb", "lib/minitest/rails/fixtures.rb", "lib/minitest/rails/helper.rb", "lib/minitest/rails/mailer.rb", "lib/minitest/rails/model.rb", "lib/minitest/rails/spec.rb", "lib/minitest/rails/tasks/minitest.rake", "test/test_controller_generator.rb", "test/test_helper_generator.rb", "test/test_install_generator.rb", "test/test_mailer_generator.rb", "test/test_minitest.rb", "test/test_model_generator.rb", "test/test_scaffold_generator.rb", ".gemtest"]
  s.homepage = "http://blowmage.com/minitest-rails"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "minitest-rails"
  s.rubygems_version = "1.8.16"
  s.summary = "MiniTest integration for Rails 3."
  s.test_files = ["test/test_controller_generator.rb", "test/test_helper_generator.rb", "test/test_install_generator.rb", "test/test_mailer_generator.rb", "test/test_minitest.rb", "test/test_model_generator.rb", "test/test_scaffold_generator.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>, ["~> 2.11"])
      s.add_runtime_dependency(%q<rails>, ["~> 3.1"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<hoe>, ["~> 2.16"])
    else
      s.add_dependency(%q<minitest>, ["~> 2.11"])
      s.add_dependency(%q<rails>, ["~> 3.1"])
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<hoe>, ["~> 2.16"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 2.11"])
    s.add_dependency(%q<rails>, ["~> 3.1"])
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<hoe>, ["~> 2.16"])
  end
end
