require "helper"

class TestActionDispatchSpecType < MiniTest::Unit::TestCase
  def assert_dispatch actual
    assert_equal ActionDispatch::IntegrationTest, actual
  end

  def refute_dispatch actual
    refute_equal ActionDispatch::IntegrationTest, actual
  end

  def test_spec_type_resolves_for_matching_acceptance_strings
    assert_dispatch MiniTest::Spec.spec_type("WidgetAcceptanceTest")
    assert_dispatch MiniTest::Spec.spec_type("Widget Acceptance Test")
    assert_dispatch MiniTest::Spec.spec_type("WidgetAcceptance")
    assert_dispatch MiniTest::Spec.spec_type("Widget Acceptance")
    # And is not case sensitive
    assert_dispatch MiniTest::Spec.spec_type("widgetacceptancetest")
    assert_dispatch MiniTest::Spec.spec_type("widget acceptance test")
    assert_dispatch MiniTest::Spec.spec_type("widgetacceptance")
    assert_dispatch MiniTest::Spec.spec_type("widget acceptance")
  end

  def test_spec_type_wont_match_non_space_characters_acceptance
    refute_dispatch MiniTest::Spec.spec_type("Widget Acceptance\tTest")
    refute_dispatch MiniTest::Spec.spec_type("Widget Acceptance\rTest")
    # TODO: Update regex so that new lines don't match.
    refute_dispatch MiniTest::Spec.spec_type("Widget Acceptance\nTest")
    refute_dispatch MiniTest::Spec.spec_type("Widget Acceptance\fTest")
    refute_dispatch MiniTest::Spec.spec_type("Widget AcceptanceXTest")
  end

  def test_spec_type_resolves_for_matching_integration_strings
    assert_dispatch MiniTest::Spec.spec_type("WidgetIntegrationTest")
    assert_dispatch MiniTest::Spec.spec_type("Widget Integration Test")
    assert_dispatch MiniTest::Spec.spec_type("WidgetIntegration")
    assert_dispatch MiniTest::Spec.spec_type("Widget Integration")
    # And is not case sensitive
    assert_dispatch MiniTest::Spec.spec_type("widgetintegrationtest")
    assert_dispatch MiniTest::Spec.spec_type("widget integration test")
    assert_dispatch MiniTest::Spec.spec_type("widgetintegration")
    assert_dispatch MiniTest::Spec.spec_type("widget integration")
  end

  def test_spec_type_wont_match_non_space_characters_integration
    refute_equal MiniTest::Spec.spec_type("Widget Integration\tTest"), ActionDispatch::IntegrationTest
    refute_equal MiniTest::Spec.spec_type("Widget Integration\rTest"), ActionDispatch::IntegrationTest
    # TODO: Update regex so that new lines don't match.
    refute_equal MiniTest::Spec.spec_type("Widget Integration\nTest"), ActionDispatch::IntegrationTest
    refute_equal MiniTest::Spec.spec_type("Widget Integration\fTest"), ActionDispatch::IntegrationTest
    refute_equal MiniTest::Spec.spec_type("Widget IntegrationXTest"),  ActionDispatch::IntegrationTest
  end
end
