require "minitest/autorun"
require "rails"

require "minitest/rails/action_view"

class TestActionViewSpecType < MiniTest::Unit::TestCase
  def test_spec_type_resolves_for_matching_strings
    assert_equal MiniTest::Spec.spec_type("WidgetHelper"), MiniTest::Rails::ActionView::TestCase
    assert_equal MiniTest::Spec.spec_type("WidgetHelperTest"), MiniTest::Rails::ActionView::TestCase
    assert_equal MiniTest::Spec.spec_type("Widget Helper Test"), MiniTest::Rails::ActionView::TestCase
    # And is not case sensitive
    assert_equal MiniTest::Spec.spec_type("widgethelper"), MiniTest::Rails::ActionView::TestCase
    assert_equal MiniTest::Spec.spec_type("widgethelpertest"), MiniTest::Rails::ActionView::TestCase
    assert_equal MiniTest::Spec.spec_type("widget helper test"), MiniTest::Rails::ActionView::TestCase
    # View specs
    assert_equal MiniTest::Spec.spec_type("WidgetView"), MiniTest::Rails::ActionView::TestCase
    assert_equal MiniTest::Spec.spec_type("WidgetViewTest"), MiniTest::Rails::ActionView::TestCase
    assert_equal MiniTest::Spec.spec_type("Widget View Test"), MiniTest::Rails::ActionView::TestCase
  end

  def test_spec_type_wont_match_non_space_characters
    refute_equal MiniTest::Spec.spec_type("Widget Helper\tTest"), MiniTest::Rails::ActionView::TestCase
    refute_equal MiniTest::Spec.spec_type("Widget Helper\rTest"), MiniTest::Rails::ActionView::TestCase
    refute_equal MiniTest::Spec.spec_type("Widget Helper\nTest"), MiniTest::Rails::ActionView::TestCase
    refute_equal MiniTest::Spec.spec_type("Widget Helper\fTest"), MiniTest::Rails::ActionView::TestCase
    refute_equal MiniTest::Spec.spec_type("Widget HelperXTest"),  MiniTest::Rails::ActionView::TestCase
  end
end
