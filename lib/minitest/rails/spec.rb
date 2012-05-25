require "minitest/unit"
require "minitest/spec"
require "minitest/mock"

module MiniTest
  module Rails
    class Spec < ::MiniTest::Spec
      alias :method_name :__name__ if defined? :__name__
      class << self
        alias :context :describe
      end
    end
  end
end
