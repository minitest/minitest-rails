require "helper"
require "generators/minitest/controller/controller_generator"

class TestControllerGenerator < GeneratorTest

  def test_controller_generator
    assert_output(/create  test\/controllers\/user_controller_test.rb/m) do
      Minitest::Generators::ControllerGenerator.start ["user"]
    end
    assert File.exists? "test/controllers/user_controller_test.rb"
    contents = File.read "test/controllers/user_controller_test.rb"
    assert_match(/class UserControllerTest/m, contents)
  end

  def test_namespaced_controller_generator
    assert_output(/create  test\/controllers\/admin\/user_controller_test.rb/m) do
      Minitest::Generators::ControllerGenerator.start ["admin/user"]
    end
    assert File.exists? "test/controllers/admin/user_controller_test.rb"
    contents = File.read "test/controllers/admin/user_controller_test.rb"
    assert_match(/class Admin::UserControllerTest/m, contents)
  end

  def test_module_namespaced_controller_generator
    assert_nil Rails::Generators.namespace
    Rails::Generators.namespace = TestApp

    assert_output(/create  test\/controllers\/test_app\/user_controller_test.rb/m) do
      Minitest::Generators::ControllerGenerator.start ["user"]
    end
    assert File.exists? "test/controllers/test_app/user_controller_test.rb"
    contents = File.read "test/controllers/test_app/user_controller_test.rb"
    assert_match(/module TestApp/m, contents)
    assert_match(/class UserControllerTest/m, contents)
  ensure
    # Restore default namespace
    Rails::Generators.namespace = nil
  end if Rails::Generators.respond_to? :namespace

  def test_controller_generator_spec
    assert_output(/create  test\/controllers\/user_controller_test.rb/m) do
      Minitest::Generators::ControllerGenerator.start ["user", "--spec"]
    end
    assert File.exists? "test/controllers/user_controller_test.rb"
    contents = File.read "test/controllers/user_controller_test.rb"
    assert_match(/describe UserController do/m, contents)
  end

  def test_namespaced_controller_generator_spec
    assert_output(/create  test\/controllers\/admin\/user_controller_test.rb/m) do
      Minitest::Generators::ControllerGenerator.start ["admin/user", "--spec"]
    end
    assert File.exists? "test/controllers/admin/user_controller_test.rb"
    contents = File.read "test/controllers/admin/user_controller_test.rb"
    assert_match(/describe Admin::UserController do/m, contents)
  end

end
