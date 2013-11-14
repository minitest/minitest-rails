require "helper"
require "generators/mini_test/model/model_generator"

class TestModelGenerator < GeneratorTest

  def test_model_generator
    assert_output(/create  test\/models\/user_test.rb/m) do
      MiniTest::Generators::ModelGenerator.start ["user"]
    end
    assert File.exists? "test/models/user_test.rb"
    contents = File.read "test/models/user_test.rb"
    assert_match(/class UserTest/m, contents)
  end

  def test_namespaced_model_generator
    assert_output(/create  test\/models\/admin\/user_test.rb/m) do
      MiniTest::Generators::ModelGenerator.start ["admin/user"]
    end
    assert File.exists? "test/models/admin/user_test.rb"
    contents = File.read "test/models/admin/user_test.rb"
    assert_match(/class Admin::UserTest/m, contents)
  end

  def test_model_generator_spec
    assert_output(/create  test\/models\/user_test.rb/m) do
      MiniTest::Generators::ModelGenerator.start ["user", "--spec"]
    end
    assert File.exists? "test/models/user_test.rb"
    assert File.exists? "test/fixtures/users.yml"
    contents = File.read "test/models/user_test.rb"
    assert_match(/describe User do/m, contents)
  end

  def test_namespaced_model_generator_spec
    assert_output(/create  test\/models\/admin\/user_test.rb/m) do
      MiniTest::Generators::ModelGenerator.start ["admin/user", "--spec"]
    end
    assert File.exists? "test/models/admin/user_test.rb"
    contents = File.read "test/models/admin/user_test.rb"
    assert_match(/describe Admin::User do/m, contents)
  end

  def test_model_generator_fixture
    assert_output(/create  test\/fixtures\/users.yml/m) do
      MiniTest::Generators::ModelGenerator.start ["user"]
    end
    assert File.exists? "test/fixtures/users.yml"
  end

  def test_namespaced_model_generator_fixture
    assert_output(/create  test\/fixtures\/admin\/users.yml/m) do
      MiniTest::Generators::ModelGenerator.start ["admin/user"]
    end
    assert File.exists? "test/fixtures/admin/users.yml"
  end

  def test_model_generator_skip_fixture
    out, _ = capture_io do
      MiniTest::Generators::ModelGenerator.start ["user", "--skip-fixture"]
    end
    refute_match(/create  test\/fixtures\/users.yml/m, out)
    refute File.exists? "test/fixtures/users.yml"
  end
end
