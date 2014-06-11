# -*- encoding: utf-8 -*-
# stub: minitest-rails 2.0.3.20140611120000 ruby lib

Gem::Specification.new do |s|
  s.name = "minitest-rails"
  s.version = "2.0.3.20140611120000"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mike Moore"]
  s.date = "2014-06-11"
  s.description = "Adds Minitest as the default testing library in Rails"
  s.email = ["mike@blowmage.com"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc"]
  s.files = [".autotest", ".gemtest", ".travis.yml", "CHANGELOG.rdoc", "Gemfile", "LICENSE", "Manifest.txt", "README.rdoc", "Rakefile", "gemfiles/4.1.gemfile", "lib/generators/.document", "lib/generators/minitest.rb", "lib/generators/minitest/controller/controller_generator.rb", "lib/generators/minitest/controller/templates/controller_spec.rb", "lib/generators/minitest/controller/templates/controller_test.rb", "lib/generators/minitest/generator/generator_generator.rb", "lib/generators/minitest/generator/templates/generator_spec.rb", "lib/generators/minitest/generator/templates/generator_test.rb", "lib/generators/minitest/helper/helper_generator.rb", "lib/generators/minitest/helper/templates/helper_spec.rb", "lib/generators/minitest/helper/templates/helper_test.rb", "lib/generators/minitest/install/install_generator.rb", "lib/generators/minitest/install/templates/test_helper.rb", "lib/generators/minitest/integration/integration_generator.rb", "lib/generators/minitest/integration/templates/integration_spec.rb", "lib/generators/minitest/integration/templates/integration_test.rb", "lib/generators/minitest/mailer/mailer_generator.rb", "lib/generators/minitest/mailer/templates/mailer_spec.rb", "lib/generators/minitest/mailer/templates/mailer_test.rb", "lib/generators/minitest/mailer/templates/preview.rb", "lib/generators/minitest/model/model_generator.rb", "lib/generators/minitest/model/templates/fixtures.yml", "lib/generators/minitest/model/templates/model_spec.rb", "lib/generators/minitest/model/templates/model_test.rb", "lib/generators/minitest/route/route_generator.rb", "lib/generators/minitest/route/templates/route_spec.rb", "lib/generators/minitest/route/templates/route_test.rb", "lib/generators/minitest/scaffold/scaffold_generator.rb", "lib/generators/minitest/scaffold/templates/controller_spec.rb", "lib/generators/minitest/scaffold/templates/controller_test.rb", "lib/minitest-rails.rb", "lib/minitest/rails.rb", "lib/minitest/rails/assertions.rb", "lib/minitest/rails/constant_lookup.rb", "lib/minitest/rails/expectations.rb", "lib/minitest/rails/railtie.rb", "lib/minitest/rails/version.rb", "minitest-rails.gemspec", "tasks/test.rake", "test/generators/test_controller_generator.rb", "test/generators/test_generator_generator.rb", "test/generators/test_helper_generator.rb", "test/generators/test_install_generator.rb", "test/generators/test_mailer_generator.rb", "test/generators/test_model_generator.rb", "test/generators/test_route_generator.rb", "test/generators/test_scaffold_generator.rb", "test/helper.rb", "test/rails/action_controller/test_assertions.rb", "test/rails/action_controller/test_controllers.rb", "test/rails/action_controller/test_expectations.rb", "test/rails/action_controller/test_spec_type.rb", "test/rails/action_dispatch/test_spec_type.rb", "test/rails/action_mailer/test_mailers.rb", "test/rails/action_mailer/test_spec_type.rb", "test/rails/action_view/test_helpers.rb", "test/rails/action_view/test_spec_type.rb", "test/rails/active_support/test_assertions.rb", "test/rails/active_support/test_expectations.rb", "test/rails/active_support/test_spec_type.rb", "test/rails/generators/test_spec_type.rb", "test/rails/minitest_5_api_test.rb", "test/rails/test_constant_lookup.rb", "test/test_sanity.rb"]
  s.homepage = "http://blowmage.com/minitest-rails"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.rubygems_version = "2.2.2"
  s.summary = "Minitest integration for Rails"
  s.test_files = ["test/generators/test_controller_generator.rb", "test/generators/test_generator_generator.rb", "test/generators/test_helper_generator.rb", "test/generators/test_install_generator.rb", "test/generators/test_mailer_generator.rb", "test/generators/test_model_generator.rb", "test/generators/test_route_generator.rb", "test/generators/test_scaffold_generator.rb", "test/rails/action_controller/test_assertions.rb", "test/rails/action_controller/test_controllers.rb", "test/rails/action_controller/test_expectations.rb", "test/rails/action_controller/test_spec_type.rb", "test/rails/action_dispatch/test_spec_type.rb", "test/rails/action_mailer/test_mailers.rb", "test/rails/action_mailer/test_spec_type.rb", "test/rails/action_view/test_helpers.rb", "test/rails/action_view/test_spec_type.rb", "test/rails/active_support/test_assertions.rb", "test/rails/active_support/test_expectations.rb", "test/rails/active_support/test_spec_type.rb", "test/rails/generators/test_spec_type.rb", "test/rails/test_constant_lookup.rb", "test/test_sanity.rb", "test/rails/minitest_5_api_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>, ["< 6.0", ">= 5.3.3"])
      s.add_runtime_dependency(%q<railties>, ["~> 4.1"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<fakefs>, ["= 0.4.3"])
      s.add_development_dependency(%q<hoe>, ["~> 3.12"])
    else
      s.add_dependency(%q<minitest>, ["< 6.0", ">= 5.3.3"])
      s.add_dependency(%q<railties>, ["~> 4.1"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<fakefs>, ["= 0.4.3"])
      s.add_dependency(%q<hoe>, ["~> 3.12"])
    end
  else
    s.add_dependency(%q<minitest>, ["< 6.0", ">= 5.3.3"])
    s.add_dependency(%q<railties>, ["~> 4.1"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<fakefs>, ["= 0.4.3"])
    s.add_dependency(%q<hoe>, ["~> 3.12"])
  end
end
