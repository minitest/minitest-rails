require "minitest/rails/test_case"

module MiniTest
  module Rails
    class HelperTestCase < TestCase
    end

    class HelperSpec < HelperTestCase
      alias :method_name :__name__ if defined? :__name__
    end
  end
end
