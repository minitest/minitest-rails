module MiniTest::Rails::Expectations

  ##############################################################################
  # ActiveSupport Expectations
  ##############################################################################

  ##
  # Checks if an expression is blank. Passes if actual.blank? is true.
  #
  #     "".must_be_blank
  #     nil.must_be_blank
  #     [].must_be_blank
  #     {}.must_be_blank
  #
  # See also ActiveSupport::TestCase#assert_blank
  #
  # :method: must_be_blank
  # :args: message = nil
  infect_an_assertion :assert_blank, :must_be_blank, :unary

  ##
  # Checks if an expression is not present. Passes if actual.present? is false.
  #
  #     "".wont_be_present
  #     nil.wont_be_present
  #     [].wont_be_present
  #     {}.wont_be_present
  #
  # See also ActiveSupport::TestCase#refute_present
  #
  # :method: wont_be_present
  # :args: message = nil
  infect_an_assertion :refute_present, :wont_be_present, :unary

  ##
  # Checks if an expression is present. Passes if actual.present? is true.
  #
  #     "here".must_be_present
  #     Object.new.must_be_present
  #     [1,2,3].must_be_present
  #     {:key => :value}.must_be_present
  #
  # See also ActiveSupport::TestCase#assert_present
  #
  # :method: must_be_present
  # :args: message = nil
  infect_an_assertion :assert_present, :must_be_present, :unary

  ##
  # Checks if an expression is not blank. Passes if actual.blank? is false.
  #
  #     "here".wont_be_blank
  #     Object.new.wont_be_blank
  #     [1,2,3].wont_be_blank
  #     {:key => :value}.wont_be_blank
  #
  # See also ActiveSupport::TestCase#refute_blank
  #
  # :method: wont_be_blank
  # :args: message = nil
  infect_an_assertion :refute_blank, :wont_be_blank, :unary

  ##
  # Checks the numeric difference between the return value of an expression as a result of what is evaluated.
  #
  #     lambda { User.create password: "valid" }.must_change "User.count"
  #     lambda { 3.times do
  #            User.create password: "valid"
  #          end }.must_change "User.count", 3
  #
  # See also ActiveSupport::TestCase#assert_difference
  #
  # :method: must_change
  # :args: expression, difference = 1, message = nil
  infect_an_assertion :assert_difference, :must_change

  ##
  # Checks that the numeric result of evaluating an expression is not changed before and after invoking.
  #
  #     lambda { User.new }.wont_change "User.count"
  #
  # See also ActiveSupport::TestCase#refute_difference
  #
  # :method: wont_change
  # :args: expression, message = nil
  infect_an_assertion :refute_difference, :wont_change

end

class Object # :nodoc:
  include MiniTest::Rails::Expectations unless ENV["MT_NO_EXPECTATIONS"]
end
