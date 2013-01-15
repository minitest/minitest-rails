# Make double-sure the RAILS_ENV is not set to production,
# so fixtures aren't loaded into that environment
abort("Abort testing: Your Rails environment is running in production mode!") if Rails.env.production?

require "minitest/rails/test_case"

# Enable turn if it is available
begin
  require "turn/autorun"
rescue LoadError
end

# Override the default ActiveSupport::TestCase to set the minitest dependency

require "active_support/test_case"
Kernel.silence_warnings do
  ActiveSupport.const_set :TestCase, MiniTest::Rails::TestCase
end

# Add spec DSL integration

if defined?(ActiveRecord::Base)
  class ActiveSupport::TestCase
    # Use AS::TestCase for the base class when describing a model
    register_spec_type(self) do |desc|
      desc < ActiveRecord::Base if desc.is_a?(Class)
    end
  end
end

require "action_controller/test_case"
class ActionController::TestCase
  # Use AC::TestCase for the base class when describing a controller
  register_spec_type(self) do |desc|
    Class === desc && desc < ActionController::Metal
  end
  register_spec_type(/Controller( ?Test)?\z/i, self)

  # Resolve the controller from the test name when using the spec DSL
  def self.determine_default_controller_class(name)
    controller = determine_constant_from_test_name(name) do |constant|
      Class === constant && constant < ActionController::Metal
    end
    raise NameError.new("Unable to resolve controller for #{name}") if controller.nil?
    controller
  end
end

require "action_view/test_case"
class ActionView::TestCase
  # Use AV::TestCase for the base class for helpers and views
  register_spec_type(/(Helper( ?Test)?| View Test)\z/i, self)

  # Resolve the helper or view from the test name when using the spec DSL
  def self.determine_default_helper_class(name)
    determine_constant_from_test_name(name) do |constant|
      Module === constant
    end
  end
end

if defined? ActionMailer
  require "action_mailer/test_helper"
  require "action_mailer/test_case"
  class ActionMailer::TestCase
    # Use AM::TestCase for the base class when describing a mailer
    register_spec_type(self) do |desc|
      desc < ActionMailer::Base if desc.is_a?(Class)
    end
    register_spec_type(/Mailer( ?Test)?\z/i, self)

    # Resolve the mailer from the test name when using the spec DSL
    def self.determine_default_mailer(name)
      mailer = determine_constant_from_test_name(name) do |constant|
        Class === constant && constant < ::ActionMailer::Base
      end
      raise ActionMailer::NonInferrableMailerError.new(name) if mailer.nil?
      mailer
    end
  end
end

require "action_dispatch/testing/integration"
class ActionDispatch::IntegrationTest
  # Register by name, consider Acceptance to be deprecated
  register_spec_type(/(Integration|Acceptance)( ?Test)?\z/i, self)
  register_spec_type(/routing/i, self)
end

# Default wiring for the tests. This was originaly done in the helper.

# Enable fixtures if appropriate

if defined?(ActiveRecord::Base)
  class ActiveSupport::TestCase
    include ActiveRecord::TestFixtures
    self.fixture_path = "#{Rails.root}/test/fixtures/"
  end

  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path

  def create_fixtures(*table_names, &block)
    ActiveRecord::Fixtures.create_fixtures(ActiveSupport::TestCase.fixture_path, table_names, {}, &block)
  end
end

# Setup the routes

class ActionController::TestCase
  setup do
    @routes = Rails.application.routes
  end
end

class ActionDispatch::IntegrationTest
  setup do
    @routes = Rails.application.routes
  end
end

# Deprecated, for backwards compatibility with older minitest-rails only

module MiniTest
  module Rails
    def self.override_testunit!
      # noop
    end
    module ActiveSupport
      TestCase = ::ActiveSupport::TestCase
    end
    module ActionController
      TestCase = ::ActionController::TestCase
    end
    module ActionView
      TestCase = ::ActionView::TestCase
    end
    module ActionMailer
      TestCase = ::ActionMailer::TestCase if defined? ::ActionMailer
    end
    module ActionDispatch
      IntegrationTest = ::ActionDispatch::IntegrationTest
    end
  end
end
