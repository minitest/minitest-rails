require "minitest/autorun"
require "rails"

require "minitest/rails/action_controller"
require "action_controller"

class ApplicationController < ActionController::Base; end
class ModelsController      < ApplicationController;  end
module Admin
  class WidgetsController < ApplicationController; end
end

class TestControllerLookup < MiniTest::Unit::TestCase
  include MiniTest::Rails::ActionController
  def test_find_application_controller
    assert_equal ApplicationController, ControllerLookup.find("ApplicationController")
    assert_equal ApplicationController, ControllerLookup.find("ApplicationControllerTest")
    assert_equal ApplicationController, ControllerLookup.find("ApplicationController::index")
    assert_equal ApplicationController, ControllerLookup.find("ApplicationController::index::authenticated")
    assert_equal ApplicationController, ControllerLookup.find("ApplicationControllerTest::index")
    assert_equal ApplicationController, ControllerLookup.find("ApplicationControllerTest::index::authenticated")
  end

  def test_find_models_controller
    assert_equal ModelsController, ControllerLookup.find("ModelsController")
    assert_equal ModelsController, ControllerLookup.find("ModelsControllerTest")
    assert_equal ModelsController, ControllerLookup.find("ModelsController::index")
    assert_equal ModelsController, ControllerLookup.find("ModelsController::index::authenticated")
    assert_equal ModelsController, ControllerLookup.find("ModelsControllerTest::index")
    assert_equal ModelsController, ControllerLookup.find("ModelsControllerTest::index::authenticated")
  end

  def test_find_admin_widgets_controller
    assert_equal Admin::WidgetsController, ControllerLookup.find("Admin::WidgetsController")
    assert_equal Admin::WidgetsController, ControllerLookup.find("Admin::WidgetsControllerTest")
    assert_equal Admin::WidgetsController, ControllerLookup.find("Admin::WidgetsController::index")
    assert_equal Admin::WidgetsController, ControllerLookup.find("Admin::WidgetsController::index::authenticated")
    assert_equal Admin::WidgetsController, ControllerLookup.find("Admin::WidgetsControllerTest::index")
    assert_equal Admin::WidgetsController, ControllerLookup.find("Admin::WidgetsControllerTest::index::authenticated")
  end

  def test_raises_when_cant_find_controller
    assert_raises(NameError) { ControllerLookup.find("DoesntExistController") }
    assert_raises(NameError) { ControllerLookup.find("DoesntExistControllerTest") }
    assert_raises(NameError) { ControllerLookup.find("DoesntExistController::Nadda") }
    assert_raises(NameError) { ControllerLookup.find("DoesntExistController::Nadda::Nope") }
    assert_raises(NameError) { ControllerLookup.find("DoesntExistController::Nadda::Nope::NotHere") }
  end
end
