require "minitest/rails/active_support"
require "action_view/test_case"

module MiniTest
  module Rails
    module ActionView
      class TestCase < MiniTest::Rails::ActiveSupport::TestCase
        include ::ActionView::TestCase::Behavior

        TestController = ::ActionView::TestCase::TestController

        # Register by name, because Helpers are just modules
        MiniTest::Spec.register_spec_type(/Helper$/,      self)
        MiniTest::Spec.register_spec_type(/HelperTest$/,  self)
        MiniTest::Spec.register_spec_type(/Helper Test$/, self)
      end
    end
  end
end

