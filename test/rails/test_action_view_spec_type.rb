require "minitest/autorun"
require "rails"

require "minitest/rails/action_view"

class TestActionViewSpecType < MiniTest::Unit::TestCase
  def test_spec_type_for_helper_string
    assert_equal MiniTest::Spec.spec_type("WidgetHelper"), MiniTest::Rails::ActionView::TestCase
  end

  def test_spec_type_for_helper_test_string
    assert_equal MiniTest::Spec.spec_type("WidgetHelperTest"), MiniTest::Rails::ActionView::TestCase
  end

  def test_spec_type_for_helper__test_string
    assert_equal MiniTest::Spec.spec_type("Widget Helper Test"), MiniTest::Rails::ActionView::TestCase
  end

  def test_spec_type_for_helper_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widgethelper"), MiniTest::Rails::ActionView::TestCase
  end

  def test_spec_type_for_helper_test_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widgethelpertest"), MiniTest::Rails::ActionView::TestCase
  end

  def test_spec_type_for_helper__test_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widget helper test"), MiniTest::Rails::ActionView::TestCase
  end
end
