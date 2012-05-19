require "minitest/unit"
require "minitest/spec"
require "minitest/mock"

module Minitest
  module Rails
    class Spec < ::Minitest::Spec
      alias :method_name :__name__ if defined? :__name__
      class << self
        alias :context :describe
      end
    end
  end
end
