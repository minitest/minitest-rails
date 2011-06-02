require "minitest/spec"
require "action_controller"

module MiniTest
  module Rails
    class ControllerTestCase < ::MiniTest::Unit::TestCase
      # include ActionController::TestCase::Behavior
    end

    class ControllerSpec < ControllerTestCase
      alias :method_name :__name__ if defined? :__name__
    end
  end
end