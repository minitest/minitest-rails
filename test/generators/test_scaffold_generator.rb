require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/mini_test/scaffold/scaffold_generator"

require "fakefs/safe"

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
    text = capture :stdout do
      MiniTest::Generators::ScaffoldGenerator.start ["user"]
    end
    assert_match /create  test\/controllers\/users_controller_test.rb/m, text
    assert File.exists? "test/controllers/users_controller_test.rb"
    contents = File.read "test/controllers/users_controller_test.rb"
    assert_match /class UsersControllerTest/m, contents
  ensure
    # TODO: Don"t write the files
    # I agree, it would be better to mock the file getting written
    FileUtils.rm_r "test/controllers"
  end

  def test_scaffold_generator_spec
    text = capture :stdout do
      MiniTest::Generators::ScaffoldGenerator.start ["user", "--spec"]
    end
    assert_match /create  test\/controllers\/users_controller_test.rb/m, text
    assert File.exists? "test/controllers/users_controller_test.rb"
    contents = File.read "test/controllers/users_controller_test.rb"
    assert_match /describe UsersController do/m, contents
  ensure
    FileUtils.rm_r "test/controllers"
  end
end
