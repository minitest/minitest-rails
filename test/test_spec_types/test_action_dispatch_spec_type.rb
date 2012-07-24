require "minitest/autorun"
require "rails"

require "minitest/rails/action_dispatch"

class TestActionDispatchSpecType < MiniTest::Unit::TestCase
  def test_spec_type_for_acceptance_test_string
    assert_equal MiniTest::Spec.spec_type('AcceptanceTest'), MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_for_acceptance__test_string
    assert_equal MiniTest::Spec.spec_type('Acceptance Test'), MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_for_integration_test_string
    assert_equal MiniTest::Spec.spec_type('IntegrationTest'), MiniTest::Rails::ActionDispatch::IntegrationTest
  end

  def test_spec_type_for_integration__test_string
    assert_equal MiniTest::Spec.spec_type('Integration Test'), MiniTest::Rails::ActionDispatch::IntegrationTest
  end
end
