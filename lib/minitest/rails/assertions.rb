class ActiveSupport::TestCase
  ##
  # Checks if an expression is blank. Passes if actual.blank? is true.
  #
  # === This assertion is deprecated.
  #
  # Use the following to check for <tt>blank?</tt> instead:
  #
  #     assert actual.blank?
  #
  # The deprecated assertion can be called like this:
  #
  #     assert_blank []
  #
  # See also MiniTest::Rails::Expectations#must_be_blank
  #
  # :method: assert_blank
  # :call-seq: assert_blank(actual, message = nil)

  ##
  # Checks if an expression is not present. Passes if actual.present? is false.
  #
  # === This assertion is deprecated.
  #
  # Use the following to check for <tt>present?</tt> instead:
  #
  #     refute actual.present?
  #
  # The deprecated assertion can be called like this:
  #
  #     refute_present nil
  #
  # See also MiniTest::Rails::Expectations#wont_be_present
  #
  # :args: actual, message = nil
  alias :refute_present :assert_blank

  ##
  # Checks if an expression is present. Passes if actual.present? is true.
  #
  # === This assertion is deprecated.
  #
  # Use the following to check for <tt>present?</tt> instead:
  #
  #     assert actual.present?
  #
  # The deprecated assertion can be called like this:
  #
  #     assert_present Object.new
  #
  # See also MiniTest::Rails::Expectations#must_be_present
  #
  # :method: assert_present
  # :call-seq: assert_present(actual, message = nil)

  ##
  # Checks if an expression is not blank. Passes if actual.blank? is false.
  #
  # === This assertion is deprecated.
  #
  # Use the following to check for <tt>blank?</tt> instead:
  #
  #     refute actual.blank?
  #
  # The deprecated assertion can be called like this:
  #
  #     refute_blank [1,2,3]
  #
  # See also MiniTest::Rails::Expectations#wont_be_blank
  #
  # :args: actual, message = nil
  alias :refute_blank :assert_present

  ##
  # Checks the numeric difference between the return value of an expression as a result of what is evaluated.
  #
  #     assert_difference "User.count", +1 do
  #       User.create
  #     end
  #
  # See also MiniTest::Rails::Expectations#must_change
  #
  # :method: assert_difference
  # :call-seq: assert_difference(expression, difference = 1, message = nil, &block)

  ##
  # Checks that the numeric result of evaluating an expression is not changed before and after invoking.
  #
  #     assert_no_difference "User.count" do
  #       User.new
  #     end
  #
  # See also MiniTest::Rails::Expectations#wont_change
  #
  # :method: assert_no_difference
  # :call-seq: assert_no_difference(expression, message = nil, &block)

  ##
  # Checks that the numeric result of evaluating an expression is not changed before and after invoking.
  #
  #     refute_difference "User.count", do
  #       User.new
  #     end
  #
  # See also MiniTest::Rails::Expectations#wont_change
  #
  # :args: expression, message = nil, &block
  alias :refute_difference :assert_no_difference

end
