require "helper"

class SomeRandomModel < ActiveRecord::Base; end

class TestActiveSupportSpecType < Minitest::Test

  def assert_support actual
    assert_equal ActiveSupport::TestCase, actual
  end

  def refute_support actual
    refute_equal ActiveSupport::TestCase, actual
  end

  def test_spec_type_resolves_for_actitive_record_constants
    assert_support Minitest::Spec.spec_type(SomeRandomModel)
  end

  def test_spec_type_doesnt_resolve_random_strings
    refute_support Minitest::Spec.spec_type("Unmatched String")
  end

  def test_spec_type_resolves_for_additional_desc_model
    assert_support Minitest::Spec.spec_type(["Unmatched String", :model])
  end
end
