module Minitest
  module Rails
    module Expectations
      module ActiveSupport
        ##
        # Test numeric difference between the return value of an expression as a
        # result of what is evaluated.
        #
        #     value { User.create password: "valid" }.must_differ "User.count"
        #     value { 3.times do
        #               User.create password: "valid"
        #             end }.must_differ "User.count", 3
        #
        # See also ActiveSupport::TestCase#assert_difference
        # See https://api.rubyonrails.org/v5.0/classes/ActiveSupport/Testing/Assertions.html#method-i-assert_difference
        #
        # :method: must_differ
        # :args: expression, *args
        infect_an_assertion :assert_difference, :must_differ, :block

        ##
        # Assertion that the numeric result of evaluating an expression is not changed
        # before and after invoking.
        #
        #     value { User.new }.wont_differ "User.count"
        #
        # See also ActiveSupport::TestCase#refute_difference
        # See https://api.rubyonrails.org/v5.0/classes/ActiveSupport/Testing/Assertions.html#method-i-assert_no_difference
        #
        # :method: wont_differ
        # :args: expression
        infect_an_assertion :refute_difference, :wont_differ, :block
      end
    end
  end
end

unless ENV["MT_NO_EXPECTATIONS"]
  class Object # :nodoc:
    include Minitest::Rails::Expectations::ActiveSupport
  end
end
