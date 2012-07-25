require "minitest/autorun"
require "rails"

require "minitest/rails/action_controller"
require "action_controller"

class ApplicationController < ActionController::Base; end
class ModelsController      < ApplicationController;  end

class TestApplicationControllerSpecType < MiniTest::Unit::TestCase
  def test_spec_type_resolves_for_class_constants
    assert_equal MiniTest::Spec.spec_type(ApplicationController), MiniTest::Rails::ActionController::TestCase
    assert_equal MiniTest::Spec.spec_type(ModelsController),      MiniTest::Rails::ActionController::TestCase
  end

  def test_spec_type_resolves_for_matching_strings
    assert_equal MiniTest::Spec.spec_type("WidgetController"),       MiniTest::Rails::ActionController::TestCase
    assert_equal MiniTest::Spec.spec_type("WidgetControllerTest"),   MiniTest::Rails::ActionController::TestCase
    assert_equal MiniTest::Spec.spec_type("Widget Controller Test"), MiniTest::Rails::ActionController::TestCase
    # And is not case sensitive
    assert_equal MiniTest::Spec.spec_type("widgetcontroller"),       MiniTest::Rails::ActionController::TestCase
    assert_equal MiniTest::Spec.spec_type("widgetcontrollertest"),   MiniTest::Rails::ActionController::TestCase
    assert_equal MiniTest::Spec.spec_type("widget controller test"), MiniTest::Rails::ActionController::TestCase
  end

  def test_spec_type_wont_match_non_space_characters
    refute_equal MiniTest::Spec.spec_type("Widget Controller\tTest"), MiniTest::Rails::ActionController::TestCase
    refute_equal MiniTest::Spec.spec_type("Widget Controller\rTest"), MiniTest::Rails::ActionController::TestCase
    refute_equal MiniTest::Spec.spec_type("Widget Controller\nTest"), MiniTest::Rails::ActionController::TestCase
    refute_equal MiniTest::Spec.spec_type("Widget Controller\fTest"), MiniTest::Rails::ActionController::TestCase
    refute_equal MiniTest::Spec.spec_type("Widget ControllerXTest"),  MiniTest::Rails::ActionController::TestCase
  end
end
