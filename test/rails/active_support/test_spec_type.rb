require "minitest/autorun"
require "rails"

require "active_record"
load "minitest/rails/active_support.rb" # Force reload
# Not sure why we need to reload, but we do...

class SomeRandomModel < ActiveRecord::Base; end

class TestActiveSupportSpecType < MiniTest::Unit::TestCase

  def assert_support actual
    assert_equal MiniTest::Rails::ActiveSupport::TestCase, actual
  end

  def assert_spec actual
    assert_equal MiniTest::Spec, actual
  end

  def test_spec_type_resolves_for_actitive_record_constants
    assert_support MiniTest::Spec.spec_type(SomeRandomModel)
  end

  def test_spec_type_doesnt_resolve_random_strings
    assert_spec MiniTest::Spec.spec_type("Unmatched String")
  end
end
