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
        register_spec_type(/Controller( ?Test)?$/, self)

        include ::ActionController::TestCase::Behavior
      end
    end
  end
end
