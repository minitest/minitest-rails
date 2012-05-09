require "minitest/rails/spec"
require "active_support/test_case"
require "action_controller"
require "action_controller/test_case"

module MiniTest
  module Rails
    class Controller < Spec
      include ActiveSupport::Testing::SetupAndTeardown
      include ActionController::TestCase::Behavior
      before do
        @routes = ::Rails.application.routes
      end
    end
  end
end
