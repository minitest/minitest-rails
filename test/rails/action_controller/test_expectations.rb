require "helper"

class TestActionControllerExpectations < ActionController::TestCase
  tests ModelsController

  def test_must_respond_with
    get :index
    must_respond_with :success
  end

  def test_must_redirect_to
    get :new
    must_redirect_to :models
  end

  def test_must_render_template
    get :index
    must_render_template :layout => false
  end

  def test_routing_expectations
    params = { :controller => "models", :action => "index" }
    path = "/models"
    params.must_route_to path
    path.must_route_from params
    params.must_route_for path
  end

  def test_must_dom_equal
    apple_link = '<a href="http://www.example.com" target="_blank">Apples</a>'
    apple_link2 = '<a target="_blank" href="http://www.example.com">Apples</a>'
    orange_link = '<a href="http://www.example.com">Oranges</a>'

    apple_link.must_dom_equal apple_link2
    apple_link.wont_dom_equal orange_link
  end

  def test_must_select
    get :index
    must_select "body h1"
    must_select "body" do
      must_select "h1"
    end
  end
end
