require "minitest/rails/spec"
require "active_support/testing/setup_and_teardown"
require "action_controller/test_case"

module MiniTest
  module Rails
    class Controller < Spec
      include ActiveSupport::Testing::SetupAndTeardown
      include ActionController::TestCase::Behavior

      before do
        @controller = self.class.name.match(/((.*)Controller)/)[1].constantize.new
        @routes     = ::Rails.application.routes
      end

      subject do
        @controller
      end
    end
  end
end

MiniTest::Spec.register_spec_type /Controller/, MiniTest::Rails::Controller

