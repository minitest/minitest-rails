require "minitest/spec"

module MiniTest
  module Rails
    class HelperTestCase < ::MiniTest::Unit::TestCase
    end

    class HelperSpec < HelperTestCase
      alias :method_name :__name__ if defined? :__name__
    end
  end
end
