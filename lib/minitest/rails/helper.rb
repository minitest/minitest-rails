require "minitest/rails/spec"

module MiniTest
  module Rails
    class Helper < Spec
      include ActiveSupport::Testing::SetupAndTeardown
      include ActionView::TestCase::Behavior
    end
  end
end
