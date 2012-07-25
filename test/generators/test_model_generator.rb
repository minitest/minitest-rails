require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/mini_test/model/model_generator"

require "fileutils"

class TestModelGenerator < MiniTest::Unit::TestCase
  Rails::Generators.no_color!

  def test_model_generator
    text = capture(:stdout) do
      MiniTest::Generators::ModelGenerator.start ["user"]
    end
    assert_match(/create  test\/models\/user_test.rb/m, text)
    assert File.exists? "test/models/user_test.rb"
    contents = open("test/models/user_test.rb").read
    assert_match(/class UserTest/m, contents)
  ensure
    # TODO: Don"t write the files
    # I agree, it would be better to mock the file getting written
    FileUtils.rm_r "test/models"
    FileUtils.rm_r "test/fixtures"
  end

  def test_model_generator_spec
    text = capture(:stdout) do
      MiniTest::Generators::ModelGenerator.start ["user", "--spec"]
    end
    assert_match(/create  test\/models\/user_test.rb/m, text)
    assert File.exists? "test/models/user_test.rb"
    assert File.exists? "test/fixtures/users.yml"
    contents = open("test/models/user_test.rb").read
    assert_match(/describe User do/m, contents)
  ensure
    FileUtils.rm_r "test/models"
    FileUtils.rm_r "test/fixtures"
  end

  def test_model_generator_fixture
    text = capture(:stdout) do
      MiniTest::Generators::ModelGenerator.start ["user"]
    end
    assert_match(/create  test\/fixtures\/users.yml/m,  text)
    assert File.exists? "test/fixtures/users.yml"
  ensure
    FileUtils.rm_r "test/models"
    FileUtils.rm_r "test/fixtures"
  end

  def test_model_generator_skip_fixture
    text = capture(:stdout) do
      MiniTest::Generators::ModelGenerator.start ["user", "--skip-fixture"]
    end
    refute_match(/create  test\/fixtures\/users.yml/m,  text)
    refute File.exists? "test/fixtures/users.yml"
  ensure
    FileUtils.rm_r "test/models"
  end
end
