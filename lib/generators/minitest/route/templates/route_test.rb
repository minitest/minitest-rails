require "test_helper"

# Add the following to your Rake file to test routes by default:
#   Minitest::Rails::Testing.default_tasks << "routes"

class RouteTest < ActionDispatch::IntegrationTest
  def test_root
    assert_routing "/", controller: "home", action: "show"
  end
end
