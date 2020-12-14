module Minitest
  module Rails
    module Expectations
      module ActiveSupport
        ##
        # Assertion that the result of evaluating an expression is changed before and
        # after invoking the passed in block.
        #
        #     value { User.create password: "valid" }.must_change "User.count"
        #     value { 3.times do
        #               User.create password: "valid"
        #             end }.must_change "User.count", from: 5, to: 8
        #
        # See also ActiveSupport::TestCase#assert_difference
        # See https://api.rubyonrails.org/v6.1/classes/ActiveSupport/Testing/Assertions.html#method-i-assert_changes
        #
        # :method: must_change
        # :args: expression, from: UNTRACKED, to: UNTRACKED
        infect_an_assertion :assert_changes, :must_change, :block

        ##
        # Assertion that the result of evaluating an expression is not changed before
        # and after invoking the passed in block.
        #
        #   refute_changes "Status.all_good?" do
        #     post :create, params: { status: { ok: true } }
        #   end
        #
        # See also ActiveSupport::TestCase#assert_difference
        # See https://api.rubyonrails.org/v6.1/classes/ActiveSupport/Testing/Assertions.html#method-i-assert_no_changes
        #
        # :method: wont_change
        # :args: expression
        infect_an_assertion :refute_changes, :wont_change, :block

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
        # See https://api.rubyonrails.org/v6.1/classes/ActiveSupport/Testing/Assertions.html#method-i-assert_difference
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
        # See https://api.rubyonrails.org/v6.1/classes/ActiveSupport/Testing/Assertions.html#method-i-assert_no_difference
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
