require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/mini_test/controller/controller_generator"

require "fakefs/safe"

class FakeFS::File
  def self.binread file
    File.open(file, "rb") { |f| f.read }
  end
end

class TestControllerGenerator < MiniTest::Unit::TestCase
  def setup
    Rails::Generators.no_color!
    FakeFS.activate!
    FakeFS::FileSystem.clone "lib/generators"
  end

  def teardown
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end

  def test_controller_generator
    text = capture(:stdout) do
      MiniTest::Generators::ControllerGenerator.start ["user"]
    end
    assert_match /create  test\/controllers\/user_controller_test.rb/m, text
    assert File.exists? "test/controllers/user_controller_test.rb"
    contents = File.read "test/controllers/user_controller_test.rb"
    assert_match /class UserControllerTest/m, contents
  end

  def test_namespaced_controller_generator
    text = capture(:stdout) do
      MiniTest::Generators::ControllerGenerator.start ["admin/user"]
    end
    assert_match /create  test\/controllers\/admin\/user_controller_test.rb/m, text
    assert File.exists? "test/controllers/admin/user_controller_test.rb"
    contents = File.read "test/controllers/admin/user_controller_test.rb"
    assert_match /class Admin::UserControllerTest/m, contents
  end

  def test_controller_generator_spec
    text = capture(:stdout) do
      MiniTest::Generators::ControllerGenerator.start ["user", "--spec"]
    end
    assert_match /create  test\/controllers\/user_controller_test.rb/m, text
    assert File.exists? "test/controllers/user_controller_test.rb"
    contents = File.read "test/controllers/user_controller_test.rb"
    assert_match /describe UserController do/m, contents
  end

  def test_namespaced_controller_generator_spec
    FakeFS do
      text = capture(:stdout) do
        MiniTest::Generators::ControllerGenerator.start ["admin/user", "--spec"]
      end
      assert_match /create  test\/controllers\/admin\/user_controller_test.rb/m, text
      assert File.exists? "test/controllers/admin/user_controller_test.rb"
      contents = File.read "test/controllers/admin/user_controller_test.rb"
      assert_match /describe Admin::UserController do/m, contents
    end
  end

end
