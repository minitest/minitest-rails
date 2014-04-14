require "helper"

class ApplicationController < ActionController::Base; end
class ModelsController      < ApplicationController;  end

class TestApplicationControllerSpecType < Minitest::Test
  def assert_controller actual
    assert_equal ActionController::TestCase, actual
  end

  def refute_controller actual
    refute_equal ActionController::TestCase, actual
  end

  def test_spec_type_resolves_for_class_constants
    assert_controller Minitest::Spec.spec_type(ApplicationController)
    assert_controller Minitest::Spec.spec_type(ModelsController)
  end

  def test_spec_type_resolves_for_matching_strings
    assert_controller Minitest::Spec.spec_type("WidgetController")
    assert_controller Minitest::Spec.spec_type("WidgetControllerTest")
    assert_controller Minitest::Spec.spec_type("Widget Controller Test")
    # And is not case sensitive
    assert_controller Minitest::Spec.spec_type("widgetcontroller")
    assert_controller Minitest::Spec.spec_type("widgetcontrollertest")
    assert_controller Minitest::Spec.spec_type("widget controller test")
  end

  def test_spec_type_wont_match_non_space_characters
    refute_controller Minitest::Spec.spec_type("Widget Controller\tTest")
    refute_controller Minitest::Spec.spec_type("Widget Controller\rTest")
    refute_controller Minitest::Spec.spec_type("Widget Controller\nTest")
    refute_controller Minitest::Spec.spec_type("Widget Controller\fTest")
    refute_controller Minitest::Spec.spec_type("Widget ControllerXTest")
  end

  def test_spec_type_resolves_for_additional_desc_controller
    refute_controller Minitest::Spec.spec_type("Unmatched String")
    assert_controller Minitest::Spec.spec_type(["Unmatched String", :controller])
  end
end
