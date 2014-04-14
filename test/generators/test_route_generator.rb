require "helper"
require "generators/minitest/route/route_generator"

class TestRouteGenerator < GeneratorTest

  def test_route_generator
    assert_output(/create  test\/routes\/route_test.rb/m) do
      Minitest::Generators::RouteGenerator.start
    end
    assert File.exists? "test/routes/route_test.rb"
    contents = File.read "test/routes/route_test.rb"
    assert_match(/class RouteTest/m, contents)
  end

  def test_route_generator_spec
    assert_output(/create  test\/routes\/route_test.rb/m) do
      Minitest::Generators::RouteGenerator.start ["--spec"]
    end
    assert File.exists? "test/routes/route_test.rb"
    contents = File.read "test/routes/route_test.rb"
    assert_match(/describe "Route Integration Test" do/m, contents)
  end

end
