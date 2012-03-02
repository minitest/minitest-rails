require "minitest/rails/spec"
require "active_support/testing/setup_and_teardown"
require "action_controller/test_case"

module MiniTest
  module Rails
    class Controller < Spec
      include ActiveSupport::Testing::SetupAndTeardown
      include ActionController::TestCase::Behavior

      # Rails 3.2 determines the controller class by matching class names that end in Test
      # This overides the #determine_default_controller_class method to allow you use Controller
      # class names in your describe argument
      def self.determine_default_controller_class(name)
        if name.match(/.*(?:^|::)(\w+Controller)/)
          $1.safe_constantize
        else
          super(name)
        end
      end

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
