require "helper"

class TestActionViewSpecType < Minitest::Test
  def assert_view actual
    assert_equal ActionView::TestCase, actual
  end

  def refute_view actual
    refute_equal ActionView::TestCase, actual
  end

  def test_spec_type_resolves_for_matching_helper_strings
    assert_view Minitest::Spec.spec_type("WidgetHelper")
    assert_view Minitest::Spec.spec_type("WidgetHelperTest")
    assert_view Minitest::Spec.spec_type("Widget Helper Test")
    # And is not case sensitive
    assert_view Minitest::Spec.spec_type("widgethelper")
    assert_view Minitest::Spec.spec_type("widgethelpertest")
    assert_view Minitest::Spec.spec_type("widget helper test")
  end

  def test_spec_type_resolves_for_matching_view_strings
    assert_view Minitest::Spec.spec_type("Widget View Test")
    # And is not case sensitive
    assert_view Minitest::Spec.spec_type("widget view test")
  end

  def test_spec_type_wont_match_models_that_end_in_view
    refute_view Minitest::Spec.spec_type("NewsOverviewTest")
    refute_view Minitest::Spec.spec_type("News Overview Test")
    refute_view Minitest::Spec.spec_type("NewsOverview")
    refute_view Minitest::Spec.spec_type("News Overview")
  end

  def test_spec_type_wont_match_non_space_characters
    refute_view Minitest::Spec.spec_type("Widget Helper\tTest")
    refute_view Minitest::Spec.spec_type("Widget Helper\rTest")
    refute_view Minitest::Spec.spec_type("Widget Helper\nTest")
    refute_view Minitest::Spec.spec_type("Widget Helper\fTest")
    refute_view Minitest::Spec.spec_type("Widget HelperXTest")
  end

  def test_spec_type_doesnt_resolve_random_strings
    refute_view Minitest::Spec.spec_type("Unmatched String")
  end

  def test_spec_type_resolves_for_additional_desc_view
    assert_view Minitest::Spec.spec_type("Unmatched String", :view)
    assert_view Minitest::Spec.spec_type("Unmatched String", :view, :other)
    assert_view Minitest::Spec.spec_type("Unmatched String", :other, :view)
  end

  def test_spec_type_resolves_for_additional_desc_helper
    assert_view Minitest::Spec.spec_type("Unmatched String", :helper)
    assert_view Minitest::Spec.spec_type("Unmatched String", :helper, :other)
    assert_view Minitest::Spec.spec_type("Unmatched String", :other, :helper)
  end
end
