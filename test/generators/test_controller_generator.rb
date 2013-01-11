require "helper"
require "generators/mini_test/controller/controller_generator"

class TestControllerGenerator < GeneratorTest

  def test_controller_generator
    assert_output(/create  test\/controllers\/user_controller_test.rb/m) do
      MiniTest::Generators::ControllerGenerator.start ["user"]
    end
    assert File.exists? "test/controllers/user_controller_test.rb"
    contents = File.read "test/controllers/user_controller_test.rb"
    assert_match(/class UserControllerTest/m, contents)
  end

  def test_namespaced_controller_generator
    assert_output(/create  test\/controllers\/admin\/user_controller_test.rb/m) do
      MiniTest::Generators::ControllerGenerator.start ["admin/user"]
    end
    assert File.exists? "test/controllers/admin/user_controller_test.rb"
    contents = File.read "test/controllers/admin/user_controller_test.rb"
    assert_match(/class Admin::UserControllerTest/m, contents)
  end

  def test_controller_generator_spec
    assert_output(/create  test\/controllers\/user_controller_test.rb/m) do
      MiniTest::Generators::ControllerGenerator.start ["user", "--spec"]
    end
    assert File.exists? "test/controllers/user_controller_test.rb"
    contents = File.read "test/controllers/user_controller_test.rb"
    assert_match(/describe UserController do/m, contents)
  end

  def test_namespaced_controller_generator_spec
    assert_output(/create  test\/controllers\/admin\/user_controller_test.rb/m) do
      MiniTest::Generators::ControllerGenerator.start ["admin/user", "--spec"]
    end
    assert File.exists? "test/controllers/admin/user_controller_test.rb"
    contents = File.read "test/controllers/admin/user_controller_test.rb"
    assert_match(/describe Admin::UserController do/m, contents)
  end

end
