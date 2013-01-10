require "helper"
require "generators/mini_test/model/model_generator"

class FakeFS::File
  def self.binread file
    File.open(file, "rb") { |f| f.read }
  end
end

class TestModelGenerator < MiniTest::Unit::TestCase
  def setup
    Rails::Generators.no_color!
    FakeFS.activate!
    FakeFS::FileSystem.clone "lib/generators"
  end

  def teardown
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end

  def test_model_generator
    out, err = capture_io do
      MiniTest::Generators::ModelGenerator.start ["user"]
    end
    assert_match(/create  test\/models\/user_test.rb/m, out)
    assert File.exists? "test/models/user_test.rb"
    contents = File.read "test/models/user_test.rb"
    assert_match(/class UserTest/m, contents)
  end

  def test_model_generator_spec
    out, err = capture_io do
      MiniTest::Generators::ModelGenerator.start ["user", "--spec"]
    end
    assert_match(/create  test\/models\/user_test.rb/m, out)
    assert File.exists? "test/models/user_test.rb"
    assert File.exists? "test/fixtures/users.yml"
    contents = File.read "test/models/user_test.rb"
    assert_match(/describe User do/m, contents)
  end

  def test_model_generator_fixture
    out, err = capture_io do
      MiniTest::Generators::ModelGenerator.start ["user"]
    end
    assert_match(/create  test\/fixtures\/users.yml/m, out)
    assert File.exists? "test/fixtures/users.yml"
  end

  def test_model_generator_skip_fixture
    out, err = capture_io do
      MiniTest::Generators::ModelGenerator.start ["user", "--skip-fixture"]
    end
    refute_match(/create  test\/fixtures\/users.yml/m, out)
    refute File.exists? "test/fixtures/users.yml"
  end
end
