require "minitest/autorun"
require "rails"

require "minitest/rails/action_controller"
require "action_controller"

class ApplicationController < ActionController::Base; end
class ModelsController < ApplicationController; end

class TestApplicationControllerSpecType < MiniTest::Unit::TestCase
  def test_spec_type_for_application_controller_class
    assert_equal MiniTest::Spec.spec_type(ApplicationController), MiniTest::Rails::ActionController::TestCase
  end

  def test_spec_type_for_inherited_controller_class
    assert_equal MiniTest::Spec.spec_type(ModelsController), MiniTest::Rails::ActionController::TestCase
  end

  def test_spec_type_for_controller_string
    assert_equal MiniTest::Spec.spec_type("WidgetController"), MiniTest::Rails::ActionController::TestCase
  end

  def test_spec_type_for_controller__test_string
    assert_equal MiniTest::Spec.spec_type("WidgetControllerTest"), MiniTest::Rails::ActionController::TestCase
  end

  def test_spec_type_for_controller_test_string
    assert_equal MiniTest::Spec.spec_type("Widget Controller Test"), MiniTest::Rails::ActionController::TestCase
  end

  def test_spec_type_for_controller_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widgetcontroller"), MiniTest::Rails::ActionController::TestCase
  end

  def test_spec_type_for_controller__test_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widgetcontrollertest"), MiniTest::Rails::ActionController::TestCase
  end

  def test_spec_type_for_controller_test_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widget controller test"), MiniTest::Rails::ActionController::TestCase
  end
end
