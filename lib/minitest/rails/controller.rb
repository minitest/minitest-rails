require "minitest/rails/base"
# require "action_controller"

module MiniTest
  module Rails
    class ControllerTestCase < TestCase
      # include ActionController::TestCase::Behavior
    end

    class ControllerSpec < Spec
    end
  end
end