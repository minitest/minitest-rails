require "minitest/unit"
require "minitest/spec"
require "minitest/mock"
require "active_support/testing/assertions"

module MiniTest
  module Rails
    class Spec < ::MiniTest::Spec
      include ActiveSupport::Testing::Assertions
      alias :method_name :__name__ if defined? :__name__
      class << self
        alias :context :describe
      end
      def build_message(*args)
        args[1].gsub(/\?/, '%s') % args[2..-1]
      end
    end
  end
end

module MiniTest::Expectations
  ##
  # See ActiveSupport::Testing::Assertions#assert_difference
  #
  #    proc { ... }.must_change(expression, difference = 1, message = nil)
  #
  # :method: must_change
  infect_an_assertion :assert_difference, :must_change

  ##
  # See ActiveSupport::Testing::Assertions#assert_no_difference
  #
  #    proc { ... }.wont_change(expression, message = nil)
  #
  # :method: wont_change
  infect_an_assertion :assert_no_difference, :wont_change

  ##
  # See ActiveSupport::Testing::Assertions#assert_blank
  #
  #    proc { ... }.must_be_blank(object, message = nil)
  #
  # :method: must_be_blank
  infect_an_assertion :assert_blank, :must_be_blank

  ##
  # See ActiveSupport::Testing::Assertions#assert_present
  #
  #    proc { ... }.must_be_present(object, message = nil)
  #
  # :method: must_be_present
  infect_an_assertion :assert_present, :must_be_present
end

