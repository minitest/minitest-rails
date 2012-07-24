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
    assert_equal MiniTest::Spec.spec_type('Controller'), MiniTest::Rails::ActionController::TestCase
  end

  def test_spec_type_for_controller__test_string
    assert_equal MiniTest::Spec.spec_type('ControllerTest'), MiniTest::Rails::ActionController::TestCase
  end

  def test_spec_type_for_controller_test_string
    assert_equal MiniTest::Spec.spec_type('Controller Test'), MiniTest::Rails::ActionController::TestCase
  end
end
