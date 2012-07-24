require "minitest/rails/active_support"
require "action_view/test_case"

module MiniTest
  module Rails
    module ActionView
      class TestCase < MiniTest::Rails::ActiveSupport::TestCase
        include ::ActionView::TestCase::Behavior

        TestController = ::ActionView::TestCase::TestController

        # Register by name, because Helpers are just modules
        register_spec_type(/Helper(\s?Test)?$/, self)
      end
    end
  end
end

