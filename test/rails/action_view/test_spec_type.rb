require "helper"

class TestActionViewSpecType < MiniTest::Unit::TestCase
  def assert_view actual
    assert_equal ActionView::TestCase, actual
  end

  def refute_view actual
    refute_equal ActionView::TestCase, actual
  end

  def test_spec_type_resolves_for_matching_helper_strings
    assert_view MiniTest::Spec.spec_type("WidgetHelper")
    assert_view MiniTest::Spec.spec_type("WidgetHelperTest")
    assert_view MiniTest::Spec.spec_type("Widget Helper Test")
    # And is not case sensitive
    assert_view MiniTest::Spec.spec_type("widgethelper")
    assert_view MiniTest::Spec.spec_type("widgethelpertest")
    assert_view MiniTest::Spec.spec_type("widget helper test")
  end

  def test_spec_type_resolves_for_matching_view_strings
    assert_view MiniTest::Spec.spec_type("Widget View Test")
    # And is not case sensitive
    assert_view MiniTest::Spec.spec_type("widget view test")
  end

  def test_spec_type_wont_match_models_that_end_in_view
    refute_view MiniTest::Spec.spec_type("NewsOverviewTest")
    refute_view MiniTest::Spec.spec_type("News Overview Test")
    refute_view MiniTest::Spec.spec_type("NewsOverview")
    refute_view MiniTest::Spec.spec_type("News Overview")
  end

  def test_spec_type_wont_match_non_space_characters
    refute_view MiniTest::Spec.spec_type("Widget Helper\tTest")
    refute_view MiniTest::Spec.spec_type("Widget Helper\rTest")
    refute_view MiniTest::Spec.spec_type("Widget Helper\nTest")
    refute_view MiniTest::Spec.spec_type("Widget Helper\fTest")
    refute_view MiniTest::Spec.spec_type("Widget HelperXTest")
  end
end
