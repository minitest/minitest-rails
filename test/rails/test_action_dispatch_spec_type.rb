require "minitest/autorun"
require "rails"

require "minitest/rails/action_dispatch"

class TestActionDispatchSpecType < MiniTest::Unit::TestCase
  def test_spec_type_resolves_for_matching_acceptance_strings
    assert_equal MiniTest::Spec.spec_type("WidgetAcceptanceTest"),   MiniTest::Rails::ActionDispatch::IntegrationTest
    assert_equal MiniTest::Spec.spec_type("Widget Acceptance Test"), MiniTest::Rails::ActionDispatch::IntegrationTest
    # And is not case sensitive
    assert_equal MiniTest::Spec.spec_type("widgetacceptancetest"),   MiniTest::Rails::ActionDispatch::IntegrationTest
    assert_equal MiniTest::Spec.spec_type("widget acceptance test"), MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_wont_match_non_space_characters_acceptance
    refute_equal MiniTest::Spec.spec_type("Widget Acceptance\tTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
    refute_equal MiniTest::Spec.spec_type("Widget Acceptance\rTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
    # TODO: Update regex so that new lines don't match.
    refute_equal MiniTest::Spec.spec_type("Widget Acceptance\nTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
    refute_equal MiniTest::Spec.spec_type("Widget Acceptance\fTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
    refute_equal MiniTest::Spec.spec_type("Widget AcceptanceXTest"),  MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_resolves_for_matching_integration_strings
    assert_equal MiniTest::Spec.spec_type("WidgetIntegrationTest"),   MiniTest::Rails::ActionDispatch::IntegrationTest
    assert_equal MiniTest::Spec.spec_type("Widget Integration Test"), MiniTest::Rails::ActionDispatch::IntegrationTest
    # And is not case sensitive
    assert_equal MiniTest::Spec.spec_type("widgetintegrationtest"),   MiniTest::Rails::ActionDispatch::IntegrationTest
    assert_equal MiniTest::Spec.spec_type("widget integration test"), MiniTest::Rails::ActionDispatch::IntegrationTest
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
