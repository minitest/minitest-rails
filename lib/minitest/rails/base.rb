require "minitest/unit"
require "minitest/spec"
require "minitest/mock"

module MiniTest
  module Rails
    class TestCase < ::MiniTest::Unit::TestCase
    end
    class Spec < ::MiniTest::Spec
      # alias :method_name :__name__ if defined? :__name__
    end
  end
end
