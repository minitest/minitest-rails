require "minitest/rails/active_support"
require "action_controller/test_case"

module MiniTest
  module Rails
    module ActionController
      class TestCase < MiniTest::Rails::ActiveSupport::TestCase
        RaiseActionExceptions = ::ActionController::TestCase::RaiseActionExceptions

        # Use AC::TestCase for the base class when describing a controller
        register_spec_type(self) do |desc|
          desc < ::ActionController::Base if desc.is_a?(Class)
        end
        register_spec_type(/Controller( ?Test)?\z/i, self)

        include ::ActionController::TestCase::Behavior

        def self.determine_default_controller_class(name)
          controller = determine_constant_from_test_name(name) do |constant|
            Class === constant && constant < ::ActionController::Metal
          end
          raise ::NameError.new("Unable to resolve controller for #{name}") if controller.nil?
          controller
        end
      end
    end
  end
end
