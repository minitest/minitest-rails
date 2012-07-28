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
          # Override this method to support nested describes
          #
          # describe WidgetsController do
          #   describe "index" do
          #     it "is successful" do
          #       assert_response :success
          #     end
          #   end
          # end
          #
          # Original implementation:
          # name.sub(/Test$/, '').safe_constantize
          # safe_constantize is not supported in Rails 3.0...
          ControllerLookup.find name
        end
      end

      module ControllerLookup
        def self.find controller
          # HACK: I don't love this implementation
          # Please suggest a better one!
          names = controller.split "::"
          controller = while names.size > 0 do
            # Remove "Test" if present
            names.last.sub! /Test$/, ''
            begin
              constant = names.join("::").constantize
              break(constant) if constant
            rescue NameError
              # do nothing
            ensure
              names.pop
            end
          end
          if controller.nil?
            raise ::NameError.new("Unable to resolve controller for #{name}")
          end
          controller
        end
      end
    end
  end
end
