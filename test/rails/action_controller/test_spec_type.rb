require "minitest/autorun"
require "rails"

require "minitest/rails/action_controller"
require "action_controller"

class ApplicationController < ActionController::Base; end
class ModelsController      < ApplicationController;  end

class TestApplicationControllerSpecType < MiniTest::Unit::TestCase
  def assert_controller actual
    assert_equal MiniTest::Rails::ActionController::TestCase, actual
  end

  def refute_controller actual
    refute_equal MiniTest::Rails::ActionController::TestCase, actual
  end

  def test_spec_type_resolves_for_class_constants
    assert_controller MiniTest::Spec.spec_type(ApplicationController)
    assert_controller MiniTest::Spec.spec_type(ModelsController)
  end

  def test_spec_type_resolves_for_matching_strings
    assert_controller MiniTest::Spec.spec_type("WidgetController")
    assert_controller MiniTest::Spec.spec_type("WidgetControllerTest")
    assert_controller MiniTest::Spec.spec_type("Widget Controller Test")
  end

  def test_spec_type_wont_match_non_space_characters
    refute_controller MiniTest::Spec.spec_type("Widget Controller\tTest")
    refute_controller MiniTest::Spec.spec_type("Widget Controller\rTest")
    refute_controller MiniTest::Spec.spec_type("Widget Controller\nTest")
    refute_controller MiniTest::Spec.spec_type("Widget Controller\fTest")
    refute_controller MiniTest::Spec.spec_type("Widget ControllerXTest")
  end

  def test_spec_type_wont_match_non_acceptance_strings
    refute_controller MiniTest::Spec.spec_type("FinancialControllerAddress")
    refute_controller MiniTest::Spec.spec_type("FinancialControllerAddressTest")
    refute_controller MiniTest::Spec.spec_type("FinancialController Address Test")
  end
end
