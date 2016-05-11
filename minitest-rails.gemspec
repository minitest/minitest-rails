# -*- encoding: utf-8 -*-
# stub: minitest-rails 3.0.0.rc1.20160511143456 ruby lib

Gem::Specification.new do |s|
  s.name = "minitest-rails".freeze
  s.version = "3.0.0.rc1.20160511143456"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mike Moore".freeze]
  s.date = "2016-05-11"
  s.description = "Adds Minitest as the default testing library in Rails".freeze
  s.email = ["mike@blowmage.com".freeze]
  s.extra_rdoc_files = ["CHANGELOG.rdoc".freeze, "Manifest.txt".freeze, "README.rdoc".freeze]
  s.files = [".autotest".freeze, ".gemtest".freeze, ".travis.yml".freeze, "CHANGELOG.rdoc".freeze, "Gemfile".freeze, "LICENSE".freeze, "Manifest.txt".freeze, "README.rdoc".freeze, "Rakefile".freeze, "gemfiles/5.0.gemfile".freeze, "gemfiles/head.gemfile".freeze, "lib/generators/.document".freeze, "lib/generators/minitest.rb".freeze, "lib/generators/minitest/controller/controller_generator.rb".freeze, "lib/generators/minitest/controller/templates/controller_spec.rb".freeze, "lib/generators/minitest/controller/templates/controller_test.rb".freeze, "lib/generators/minitest/generator/generator_generator.rb".freeze, "lib/generators/minitest/generator/templates/generator_spec.rb".freeze, "lib/generators/minitest/generator/templates/generator_test.rb".freeze, "lib/generators/minitest/helper/helper_generator.rb".freeze, "lib/generators/minitest/install/install_generator.rb".freeze, "lib/generators/minitest/install/templates/test_helper.rb".freeze, "lib/generators/minitest/integration/integration_generator.rb".freeze, "lib/generators/minitest/integration/templates/integration_spec.rb".freeze, "lib/generators/minitest/integration/templates/integration_test.rb".freeze, "lib/generators/minitest/job/job_generator.rb".freeze, "lib/generators/minitest/job/templates/job_spec.rb".freeze, "lib/generators/minitest/job/templates/job_test.rb".freeze, "lib/generators/minitest/mailer/mailer_generator.rb".freeze, "lib/generators/minitest/mailer/templates/mailer_spec.rb".freeze, "lib/generators/minitest/mailer/templates/mailer_test.rb".freeze, "lib/generators/minitest/mailer/templates/preview.rb".freeze, "lib/generators/minitest/model/model_generator.rb".freeze, "lib/generators/minitest/model/templates/fixtures.yml".freeze, "lib/generators/minitest/model/templates/model_spec.rb".freeze, "lib/generators/minitest/model/templates/model_test.rb".freeze, "lib/generators/minitest/scaffold/scaffold_generator.rb".freeze, "lib/generators/minitest/scaffold/templates/api_controller_spec.rb".freeze, "lib/generators/minitest/scaffold/templates/api_controller_test.rb".freeze, "lib/generators/minitest/scaffold/templates/controller_spec.rb".freeze, "lib/generators/minitest/scaffold/templates/controller_test.rb".freeze, "lib/minitest-rails.rb".freeze, "lib/minitest/rails.rb".freeze, "lib/minitest/rails/assertions.rb".freeze, "lib/minitest/rails/constant_lookup.rb".freeze, "lib/minitest/rails/controller.rb".freeze, "lib/minitest/rails/expectations.rb".freeze, "lib/minitest/rails/railtie.rb".freeze, "lib/minitest/rails/version.rb".freeze, "minitest-rails.gemspec".freeze, "tasks/test.rake".freeze, "test/generators/test_controller_generator.rb".freeze, "test/generators/test_generator_generator.rb".freeze, "test/generators/test_helper_generator.rb".freeze, "test/generators/test_install_generator.rb".freeze, "test/generators/test_job_generator.rb".freeze, "test/generators/test_mailer_generator.rb".freeze, "test/generators/test_model_generator.rb".freeze, "test/generators/test_scaffold_generator.rb".freeze, "test/helper.rb".freeze, "test/rails/action_dispatch/test_assertions.rb".freeze, "test/rails/action_dispatch/test_expectations.rb".freeze, "test/rails/action_dispatch/test_spec_type.rb".freeze, "test/rails/action_mailer/test_mailers.rb".freeze, "test/rails/action_mailer/test_spec_type.rb".freeze, "test/rails/action_view/test_helpers.rb".freeze, "test/rails/action_view/test_spec_type.rb".freeze, "test/rails/active_job/test_assertions.rb".freeze, "test/rails/active_job/test_expectations.rb".freeze, "test/rails/active_job/test_spec_type.rb".freeze, "test/rails/active_support/test_assertions.rb".freeze, "test/rails/active_support/test_expectations.rb".freeze, "test/rails/active_support/test_spec_type.rb".freeze, "test/rails/generators/test_spec_type.rb".freeze, "test/rails/test_constant_lookup.rb".freeze, "test/test_sanity.rb".freeze]
  s.homepage = "http://blowmage.com/minitest-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Minitest integration for Rails".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>.freeze, ["~> 5.8"])
      s.add_runtime_dependency(%q<railties>.freeze, ["~> 5.0.0.rc1"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<fakefs>.freeze, ["= 0.4.3"])
      s.add_development_dependency(%q<minitest-focus>.freeze, ["~> 1.1"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.15"])
    else
      s.add_dependency(%q<minitest>.freeze, ["~> 5.8"])
      s.add_dependency(%q<railties>.freeze, ["~> 5.0.0.rc1"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_dependency(%q<fakefs>.freeze, ["= 0.4.3"])
      s.add_dependency(%q<minitest-focus>.freeze, ["~> 1.1"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.15"])
    end
  else
    s.add_dependency(%q<minitest>.freeze, ["~> 5.8"])
    s.add_dependency(%q<railties>.freeze, ["~> 5.0.0.rc1"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_dependency(%q<fakefs>.freeze, ["= 0.4.3"])
    s.add_dependency(%q<minitest-focus>.freeze, ["~> 1.1"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.15"])
  end
end
