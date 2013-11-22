# -*- encoding: utf-8 -*-
# stub: minitest-rails 0.9.2.20131122075817 ruby lib

Gem::Specification.new do |s|
  s.name = "minitest-rails"
  s.version = "0.9.2.20131122075817"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Moore"]
  s.date = "2013-11-22"
  s.description = "Adds MiniTest as the default testing library in Rails 3 and 4"
  s.email = ["mike@blowmage.com"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc"]
  s.files = [".autotest", ".gemtest", ".travis.yml", "CHANGELOG.rdoc", "Gemfile", "LICENSE", "Manifest.txt", "README.rdoc", "Rakefile", "gemfiles/3.0.gemfile", "gemfiles/3.1.gemfile", "gemfiles/3.2.gemfile", "gemfiles/4.0.gemfile", "gemfiles/minitest_tu_shim.rb", "lib/generators/.document", "lib/generators/mini_test.rb", "lib/generators/mini_test/controller/controller_generator.rb", "lib/generators/mini_test/controller/templates/controller_spec.rb", "lib/generators/mini_test/controller/templates/controller_test.rb", "lib/generators/mini_test/helper/helper_generator.rb", "lib/generators/mini_test/helper/templates/helper_spec.rb", "lib/generators/mini_test/helper/templates/helper_test.rb", "lib/generators/mini_test/install/install_generator.rb", "lib/generators/mini_test/install/templates/test_helper.rb", "lib/generators/mini_test/integration/integration_generator.rb", "lib/generators/mini_test/integration/templates/integration_spec.rb", "lib/generators/mini_test/integration/templates/integration_test.rb", "lib/generators/mini_test/mailer/mailer_generator.rb", "lib/generators/mini_test/mailer/templates/mailer_spec.rb", "lib/generators/mini_test/mailer/templates/mailer_test.rb", "lib/generators/mini_test/model/model_generator.rb", "lib/generators/mini_test/model/templates/fixtures.yml", "lib/generators/mini_test/model/templates/model_spec.rb", "lib/generators/mini_test/model/templates/model_test.rb", "lib/generators/mini_test/route/route_generator.rb", "lib/generators/mini_test/route/templates/route_spec.rb", "lib/generators/mini_test/route/templates/route_test.rb", "lib/generators/mini_test/scaffold/scaffold_generator.rb", "lib/generators/mini_test/scaffold/templates/controller_spec.rb", "lib/generators/mini_test/scaffold/templates/controller_test.rb", "lib/minitest-rails.rb", "lib/minitest/rails.rb", "lib/minitest/rails/assertions.rb", "lib/minitest/rails/constant_lookup.rb", "lib/minitest/rails/deprecated/action_controller.rb", "lib/minitest/rails/deprecated/action_dispatch.rb", "lib/minitest/rails/deprecated/action_mailer.rb", "lib/minitest/rails/deprecated/action_view.rb", "lib/minitest/rails/deprecated/active_support.rb", "lib/minitest/rails/expectations.rb", "lib/minitest/rails/generators.rb", "lib/minitest/rails/railtie.rb", "lib/minitest/rails/tasks/.document", "lib/minitest/rails/tasks/minitest.rake", "lib/minitest/rails/tasks/sub_test_task.rb", "lib/minitest/rails/testing.rb", "lib/minitest/rails/version.rb", "minitest-rails.gemspec", "tasks/test.rake", "test/generators/test_controller_generator.rb", "test/generators/test_helper_generator.rb", "test/generators/test_install_generator.rb", "test/generators/test_mailer_generator.rb", "test/generators/test_model_generator.rb", "test/generators/test_route_generator.rb", "test/generators/test_scaffold_generator.rb", "test/helper.rb", "test/rails/action_controller/test_controllers.rb", "test/rails/action_controller/test_spec_type.rb", "test/rails/action_dispatch/test_spec_type.rb", "test/rails/action_mailer/test_mailers.rb", "test/rails/action_mailer/test_spec_type.rb", "test/rails/action_view/test_helpers.rb", "test/rails/action_view/test_spec_type.rb", "test/rails/active_support/test_assertions.rb", "test/rails/active_support/test_expectations.rb", "test/rails/active_support/test_spec_type.rb", "test/rails/generators/test_spec_type.rb", "test/rails/minitest_5_api_test.rb", "test/rails/test_constant_lookup.rb", "test/test_sanity.rb"]
  s.homepage = "http://blowmage.com/minitest-rails"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "minitest-rails"
  s.rubygems_version = "2.1.9"
  s.summary = "MiniTest integration for Rails 3 and 4"
  s.test_files = ["test/generators/test_controller_generator.rb", "test/generators/test_helper_generator.rb", "test/generators/test_install_generator.rb", "test/generators/test_mailer_generator.rb", "test/generators/test_model_generator.rb", "test/generators/test_route_generator.rb", "test/generators/test_scaffold_generator.rb", "test/rails/action_controller/test_controllers.rb", "test/rails/action_controller/test_spec_type.rb", "test/rails/action_dispatch/test_spec_type.rb", "test/rails/action_mailer/test_mailers.rb", "test/rails/action_mailer/test_spec_type.rb", "test/rails/action_view/test_helpers.rb", "test/rails/action_view/test_spec_type.rb", "test/rails/active_support/test_assertions.rb", "test/rails/active_support/test_expectations.rb", "test/rails/active_support/test_spec_type.rb", "test/rails/generators/test_spec_type.rb", "test/rails/test_constant_lookup.rb", "test/test_sanity.rb", "test/rails/minitest_5_api_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>, ["~> 4.7"])
      s.add_runtime_dependency(%q<minitest-test>, ["~> 1.0"])
      s.add_runtime_dependency(%q<railties>, [">= 3.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<fakefs>, ["~> 0.4"])
      s.add_development_dependency(%q<hoe>, ["~> 3.7"])
    else
      s.add_dependency(%q<minitest>, ["~> 4.7"])
      s.add_dependency(%q<minitest-test>, ["~> 1.0"])
      s.add_dependency(%q<railties>, [">= 3.0"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<fakefs>, ["~> 0.4"])
      s.add_dependency(%q<hoe>, ["~> 3.7"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 4.7"])
    s.add_dependency(%q<minitest-test>, ["~> 1.0"])
    s.add_dependency(%q<railties>, [">= 3.0"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<fakefs>, ["~> 0.4"])
    s.add_dependency(%q<hoe>, ["~> 3.7"])
  end
end
