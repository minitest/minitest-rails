require "minitest/rails/active_support"
require "action_controller/test_case"

module MiniTest
  module Rails
    module ActionController
      class TestCase < MiniTest::Rails::ActiveSupport::TestCase
        include ::ActionController::TestCase::Behavior

        RaiseActionExceptions = ::ActionController::TestCase::RaiseActionExceptions

        # Use AC::TestCase for the base class when describing a controller
        register_spec_type(self) do |desc|
          desc < ::ActionController::Base if desc.is_a?(Class)
        end
        MiniTest::Spec.register_spec_type(/Controller$/,      self)
        MiniTest::Spec.register_spec_type(/ControllerTest$/,  self)
        MiniTest::Spec.register_spec_type(/Controller Test$/, self)
      end
    end
  end
end
