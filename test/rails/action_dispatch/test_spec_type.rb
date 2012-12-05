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
    assert_dispatch MiniTest::Spec.spec_type("WidgetAcceptance")
    assert_dispatch MiniTest::Spec.spec_type("Widget Acceptance")
  end

  def test_spec_type_wont_match_non_space_characters_acceptance
    refute_dispatch MiniTest::Spec.spec_type("Widget Acceptance\tTest")
    refute_dispatch MiniTest::Spec.spec_type("Widget Acceptance\rTest")
  end

  def test_spec_type_resolves_for_matching_integration_strings
    assert_dispatch MiniTest::Spec.spec_type("WidgetIntegrationTest")
    assert_dispatch MiniTest::Spec.spec_type("Widget Integration Test")
    assert_dispatch MiniTest::Spec.spec_type("WidgetIntegration")
    assert_dispatch MiniTest::Spec.spec_type("Widget Integration")
  end

  def test_spec_type_wont_match_non_space_characters_integration
    refute_equal MiniTest::Spec.spec_type("Widget Integration\tTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
    refute_equal MiniTest::Spec.spec_type("Widget Integration\rTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
    # TODO: Update regex so that new lines don't match.
    refute_equal MiniTest::Spec.spec_type("Widget Integration\nTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
    refute_equal MiniTest::Spec.spec_type("Widget Integration\fTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
    refute_equal MiniTest::Spec.spec_type("Widget IntegrationXTest"),  MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_wont_match_non_acceptance_strings
    refute_dispatch MiniTest::Spec.spec_type("AcceptanceCriteria")
    refute_dispatch MiniTest::Spec.spec_type("AcceptanceCriteriaTest")
    refute_dispatch MiniTest::Spec.spec_type("Acceptance Criteria")
    refute_dispatch MiniTest::Spec.spec_type("Acceptance Criteria Test")
    refute_dispatch MiniTest::Spec.spec_type("IntegrationProcess")
    refute_dispatch MiniTest::Spec.spec_type("IntegrationProcessTest")
    refute_dispatch MiniTest::Spec.spec_type("Integration Process Test")
    refute_dispatch MiniTest::Spec.spec_type("IntegrationSolver")
    refute_dispatch MiniTest::Spec.spec_type("IntegrationSolverTest")
    refute_dispatch MiniTest::Spec.spec_type("Integration Solver Test")
  end
end
