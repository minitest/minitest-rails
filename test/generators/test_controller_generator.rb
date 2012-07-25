require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/mini_test/controller/controller_generator"

require "fileutils"

class TestControllerGenerator < MiniTest::Unit::TestCase
  Rails::Generators.no_color!

  def test_controller_generator
    text = capture(:stdout) do
      MiniTest::Generators::ControllerGenerator.start ["user"]
    end
    assert_match(/create  test\/controllers\/user_controller_test.rb/m, text)
    assert File.exists? "test/controllers/user_controller_test.rb"
    contents = open("test/controllers/user_controller_test.rb").read
    assert_match(/class UserControllerTest/m, contents)
  ensure
    # TODO: Don"t write the files
    # I agree, it would be better to mock the file getting written
    FileUtils.rm_r "test/controllers"
  end

  def test_namespaced_controller_generator
    text = capture(:stdout) do
      MiniTest::Generators::ControllerGenerator.start ["admin/user"]
    end
    assert_match(/create  test\/controllers\/admin\/user_controller_test.rb/m, text)
    assert File.exists? "test/controllers/admin/user_controller_test.rb"
    contents = open("test/controllers/admin/user_controller_test.rb").read
    assert_match(/class Admin::UserControllerTest/m, contents)
  ensure
    FileUtils.rm_r "test/controllers"
  end

  def test_controller_generator_spec
    text = capture(:stdout) do
      MiniTest::Generators::ControllerGenerator.start ["user", "--spec"]
    end
    assert_match(/create  test\/controllers\/user_controller_test.rb/m, text)
    assert File.exists? "test/controllers/user_controller_test.rb"
    contents = open("test/controllers/user_controller_test.rb").read
    assert_match(/describe UserController do/m, contents)
  ensure
    FileUtils.rm_r "test/controllers"
  end

  def test_namespaced_controller_generator_spec
    text = capture(:stdout) do
      MiniTest::Generators::ControllerGenerator.start ["admin/user", "--spec"]
    end
    assert_match(/create  test\/controllers\/admin\/user_controller_test.rb/m, text)
    assert File.exists? "test/controllers/admin/user_controller_test.rb"
    contents = open("test/controllers/admin/user_controller_test.rb").read
    assert_match(/describe Admin::UserController do/m, contents)
  ensure
    FileUtils.rm_r "test/controllers"
  end

end
