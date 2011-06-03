require "minitest/unit"
require "minitest/spec"
require "minitest/mock"

require "active_support/testing/setup_and_teardown"

module MiniTest
  module Rails
    class Spec < ::MiniTest::Spec
      include ActiveSupport::Testing::SetupAndTeardown

      alias :method_name :__name__ if defined? :__name__
    end
  end
end
