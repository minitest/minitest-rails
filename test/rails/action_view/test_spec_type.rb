require "minitest/autorun"
require "rails"

require "minitest/rails/action_view"

class TestActionViewSpecType < MiniTest::Unit::TestCase
  def assert_view actual
    assert_equal MiniTest::Rails::ActionView::TestCase, actual
  end

  def refute_view actual
    refute_equal MiniTest::Rails::ActionView::TestCase, actual
  end

  def test_spec_type_resolves_for_matching_helper_strings
    assert_view MiniTest::Spec.spec_type("WidgetHelper")
    assert_view MiniTest::Spec.spec_type("WidgetHelperTest")
    assert_view MiniTest::Spec.spec_type("Widget Helper Test")
  end

  def test_spec_type_resolves_for_matching_view_strings
    assert_view MiniTest::Spec.spec_type("WidgetView")
    assert_view MiniTest::Spec.spec_type("WidgetViewTest")
    assert_view MiniTest::Spec.spec_type("Widget View Test")
  end

  def test_spec_type_wont_match_non_space_characters
    refute_view MiniTest::Spec.spec_type("Widget Helper\tTest")
    refute_view MiniTest::Spec.spec_type("Widget Helper\rTest")
    refute_view MiniTest::Spec.spec_type("Widget Helper\nTest")
    refute_view MiniTest::Spec.spec_type("Widget Helper\fTest")
    refute_view MiniTest::Spec.spec_type("Widget HelperXTest")
  end

  def test_spec_type_wont_match_non_view_strings
    refute_view MiniTest::Spec.spec_type("Overview")
    refute_view MiniTest::Spec.spec_type("OverviewTest")
    refute_view MiniTest::Spec.spec_type("Overview Test")
    refute_view MiniTest::Spec.spec_type("Viewer")
    refute_view MiniTest::Spec.spec_type("ViewerTest")
    refute_view MiniTest::Spec.spec_type("Viewer Test")
    refute_view MiniTest::Spec.spec_type("WidgetViewWidgetTest")
  end
end
