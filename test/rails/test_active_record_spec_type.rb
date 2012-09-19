require "minitest/autorun"
require "active_record"
require "minitest-rails"
require "minitest/rails/active_support"

class TestActiveRecordSpecType < MiniTest::Unit::TestCase
  class AModel < ActiveRecord::Base; end

  def test_spec_type_resolves_for_matching_strings
    assert_equal MiniTest::Spec.spec_type(AModel), MiniTest::Rails::ActiveSupport::TestCase
  end

  def test_string_descriptions_continue_to_match_minitest_spec
    assert_equal MiniTest::Spec.spec_type('some string'), MiniTest::Spec
  end
end
