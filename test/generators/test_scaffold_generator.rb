require "helper"
require "generators/minitest/scaffold/scaffold_generator"

class TestScaffoldGenerator < GeneratorTest

  def test_scaffold_generator
    assert_output(/create  test\/controllers\/users_controller_test.rb/m) do
      Minitest::Generators::ScaffoldGenerator.start ["User", "name:string", "email:string"]
    end
    assert File.exists? "test/controllers/users_controller_test.rb"
    contents = File.read "test/controllers/users_controller_test.rb"
    assert_match(/class UsersControllerTest/m, contents)
    assert_match(/post :create, user: { email: user.email, name: user.name }/m, contents)
  end

  def test_scaffold_generator_spec
    assert_output(/create  test\/controllers\/users_controller_test.rb/m) do
      Minitest::Generators::ScaffoldGenerator.start ["User", "name:string", "email:string", "--spec"]
    end
    assert File.exists? "test/controllers/users_controller_test.rb"
    contents = File.read "test/controllers/users_controller_test.rb"
    assert_match(/describe UsersController do/m, contents)
    assert_match(/post :create, user: { email: user.email, name: user.name }/m, contents)
  end

end
