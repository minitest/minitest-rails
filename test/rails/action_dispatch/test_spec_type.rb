require "minitest/autorun"
require "rails"

require "minitest/rails/action_dispatch"

class TestActionDispatchSpecType < MiniTest::Unit::TestCase
  def assert_dispatch actual
    assert_equal MiniTest::Rails::ActionDispatch::IntegrationTest, actual
  end

  def refute_dispatch actual
    refute_equal MiniTest::Rails::ActionDispatch::IntegrationTest, actual
  end

  def test_spec_type_resolves_for_matching_acceptance_strings
    assert_dispatch MiniTest::Spec.spec_type("WidgetAcceptanceTest")
    assert_dispatch MiniTest::Spec.spec_type("Widget Acceptance Test")
    # And is not case sensitive
    assert_dispatch MiniTest::Spec.spec_type("widgetacceptancetest")
    assert_dispatch MiniTest::Spec.spec_type("widget acceptance test")
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
    # And is not case sensitive
    assert_dispatch MiniTest::Spec.spec_type("widgetintegrationtest")
    assert_dispatch MiniTest::Spec.spec_type("widget integration test")
  end

  def test_spec_type_wont_match_non_space_characters_integration
    refute_equal MiniTest::Spec.spec_type("Widget Integration\tTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
    refute_equal MiniTest::Spec.spec_type("Widget Integration\rTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
    # TODO: Update regex so that new lines don't match.
    refute_equal MiniTest::Spec.spec_type("Widget Integration\nTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
    refute_equal MiniTest::Spec.spec_type("Widget Integration\fTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
    refute_equal MiniTest::Spec.spec_type("Widget IntegrationXTest"),  MiniTest::Rails::ActionDispatch::IntegrationTest
  end
end
