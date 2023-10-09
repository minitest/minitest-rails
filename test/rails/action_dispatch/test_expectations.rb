require "helper"
require "rails/test_help"

class TestIntegrationExpectations < ActionDispatch::IntegrationTest
  def test_must_respond_with
    get models_path
    must_respond_with :success
    value(response).must_be :successful?
  end

  def test_must_redirect_to
    get new_model_path
    must_redirect_to :models
  end

  def test_routing_expectations
    params = { controller: "models", action: "index" }
    path = "/models"
    value(params).must_route_to path
    value(path).must_route_from params
    value(params).must_route_for path
  end

  def test_must_dom_equal
    apple_link = '<a href="http://www.example.com" target="_blank">Apples</a>'
    apple_link2 = '<a target="_blank" href="http://www.example.com">Apples</a>'
    orange_link = '<a href="http://www.example.com">Oranges</a>'

    value(apple_link).must_dom_equal apple_link2
    value(apple_link).wont_dom_equal orange_link
  end

  def test_must_select
    get models_path
    must_select "body h1"
    must_select "body" do
      must_select "h1"
    end
  end
end
