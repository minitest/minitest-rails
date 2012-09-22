require "minitest/rails/active_support"
require "action_view/test_case"

module MiniTest
  module Rails
    module ActionView
      class TestCase < MiniTest::Rails::ActiveSupport::TestCase
        TestController = ::ActionView::TestCase::TestController

        # Use AV::TestCase for the base class for helpers and views
        register_spec_type(/(Helper|View)( ?Test)?\z/i, self)

        include ::ActionView::TestCase::Behavior

        def self.determine_default_helper_class(name)
          determine_constant_from_test_name(name) do |constant|
            Module === constant
          end
        end
      end
    end
  end
end
