require "helper"
require "generators/mini_test/scaffold/scaffold_generator"

class FakeFS::File
  def self.binread file
    File.open(file, "rb") { |f| f.read }
  end
end

class TestScaffoldGenerator < MiniTest::Unit::TestCase
  def setup
    Rails::Generators.no_color!
    FakeFS.activate!
    FakeFS::FileSystem.clone "lib/generators"
  end

  def teardown
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end

  def test_scaffold_generator
    out, err = capture_io do
      MiniTest::Generators::ScaffoldGenerator.start ["user"]
    end
    assert_match(/create  test\/controllers\/users_controller_test.rb/m, out)
    assert File.exists? "test/controllers/users_controller_test.rb"
    contents = File.read "test/controllers/users_controller_test.rb"
    assert_match(/class UsersControllerTest/m, contents)
  end

  def test_scaffold_generator_spec
    out, err = capture_io do
      MiniTest::Generators::ScaffoldGenerator.start ["user", "--spec"]
    end
    assert_match(/create  test\/controllers\/users_controller_test.rb/m, out)
    assert File.exists? "test/controllers/users_controller_test.rb"
    contents = File.read "test/controllers/users_controller_test.rb"
    assert_match(/describe UsersController do/m, contents)
  end
end
