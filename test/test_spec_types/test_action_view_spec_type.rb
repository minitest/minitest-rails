require "minitest/autorun"
require "rails"

require "minitest/rails/action_view"

class TestActionViewSpecType < MiniTest::Unit::TestCase
  def test_spec_type_for_helper_string
    assert_equal MiniTest::Spec.spec_type('Helper'), MiniTest::Rails::ActionView::TestCase
  end

  def test_spec_type_for_helper_test_string
    assert_equal MiniTest::Spec.spec_type('HelperTest'), MiniTest::Rails::ActionView::TestCase
  end

  def test_spec_type_for_helper__test_string
    assert_equal MiniTest::Spec.spec_type('Helper Test'), MiniTest::Rails::ActionView::TestCase
  end
end
