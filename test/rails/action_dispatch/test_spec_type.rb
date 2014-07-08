require "helper"

class TestActionDispatchSpecType < Minitest::Test
  def assert_dispatch actual
    assert_equal ActionDispatch::IntegrationTest, actual
  end

  def refute_dispatch actual
    refute_equal ActionDispatch::IntegrationTest, actual
  end

  def test_spec_type_resolves_for_matching_acceptance_strings
    assert_dispatch Minitest::Spec.spec_type("WidgetAcceptanceTest")
    assert_dispatch Minitest::Spec.spec_type("Widget Acceptance Test")
    assert_dispatch Minitest::Spec.spec_type("WidgetAcceptance")
    assert_dispatch Minitest::Spec.spec_type("Widget Acceptance")
    # And is not case sensitive
    assert_dispatch Minitest::Spec.spec_type("widgetacceptancetest")
    assert_dispatch Minitest::Spec.spec_type("widget acceptance test")
    assert_dispatch Minitest::Spec.spec_type("widgetacceptance")
    assert_dispatch Minitest::Spec.spec_type("widget acceptance")
  end

  def test_spec_type_wont_match_non_space_characters_acceptance
    refute_dispatch Minitest::Spec.spec_type("Widget Acceptance\tTest")
    refute_dispatch Minitest::Spec.spec_type("Widget Acceptance\rTest")
    refute_dispatch Minitest::Spec.spec_type("Widget Acceptance\nTest")
    refute_dispatch Minitest::Spec.spec_type("Widget Acceptance\fTest")
    refute_dispatch Minitest::Spec.spec_type("Widget AcceptanceXTest")
  end

  def test_spec_type_resolves_for_matching_integration_strings
    assert_dispatch Minitest::Spec.spec_type("WidgetIntegrationTest")
    assert_dispatch Minitest::Spec.spec_type("Widget Integration Test")
    assert_dispatch Minitest::Spec.spec_type("WidgetIntegration")
    assert_dispatch Minitest::Spec.spec_type("Widget Integration")
    # And is not case sensitive
    assert_dispatch Minitest::Spec.spec_type("widgetintegrationtest")
    assert_dispatch Minitest::Spec.spec_type("widget integration test")
    assert_dispatch Minitest::Spec.spec_type("widgetintegration")
    assert_dispatch Minitest::Spec.spec_type("widget integration")
  end

  def test_spec_type_wont_match_non_space_characters_integration
    refute_dispatch Minitest::Spec.spec_type("Widget Integration\tTest")
    refute_dispatch Minitest::Spec.spec_type("Widget Integration\rTest")
    refute_dispatch Minitest::Spec.spec_type("Widget Integration\nTest")
    refute_dispatch Minitest::Spec.spec_type("Widget Integration\fTest")
    refute_dispatch Minitest::Spec.spec_type("Widget IntegrationXTest")
  end

  def test_spec_type_doesnt_resolve_random_strings
    refute_dispatch Minitest::Spec.spec_type("Unmatched String")
  end

  def test_spec_type_resolves_for_additional_desc_integration
    assert_dispatch Minitest::Spec.spec_type("Unmatched String", :integration)
    assert_dispatch Minitest::Spec.spec_type("Unmatched String", :integration, :other)
    assert_dispatch Minitest::Spec.spec_type("Unmatched String", :other, :integration)
  end
end
