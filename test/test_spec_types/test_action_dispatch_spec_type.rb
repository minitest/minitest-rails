require "minitest/autorun"
require "rails"

require "minitest/rails/action_dispatch"

class TestActionDispatchSpecType < MiniTest::Unit::TestCase
  def test_spec_type_for_acceptance_test_string
    assert_equal MiniTest::Spec.spec_type("WidgetAcceptanceTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_for_acceptance__test_string
    assert_equal MiniTest::Spec.spec_type("Widget Acceptance Test"), MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_for_acceptance_test_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widgetacceptancetest"), MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_for_acceptance__test_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widget acceptance test"), MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_for_integration_test_string
    assert_equal MiniTest::Spec.spec_type("WidgetIntegrationTest"), MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_for_integration__test_string
    assert_equal MiniTest::Spec.spec_type("Widget Integration Test"), MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_for_integration_test_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widgetintegrationtest"), MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_for_integration__test_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widget integration test"), MiniTest::Rails::ActionDispatch::IntegrationTest
  end
end
