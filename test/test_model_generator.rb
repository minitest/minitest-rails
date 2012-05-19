require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/minitest/model/model_generator"

require "fileutils"

class TestModelGenerator < Minitest::Unit::TestCase
  Rails::Generators.no_color!

  def test_model_generator
    text = capture(:stdout) do
      Minitest::Generators::ModelGenerator.start ["user"]
    end
    assert_match(/create  test\/models\/user_test.rb/m, text)
    assert File.exists? "test/models/user_test.rb"
    contents = open("test/models/user_test.rb").read
    assert_match(/class UserTest < Minitest::Rails::Model/m, contents)
  ensure
    # TODO: Don"t write the files
    # I agree, it would be better to mock the file getting written
    FileUtils.rm_r "test/models"
  end

  def test_model_generator_spec
    text = capture(:stdout) do
      Minitest::Generators::ModelGenerator.start ["user", "--spec"]
    end
    assert_match(/create  test\/models\/user_test.rb/m, text)
    assert File.exists? "test/models/user_test.rb"
    contents = open("test/models/user_test.rb").read
    assert_match(/describe User do/m, contents)
    assert_match(/subject \{ User.new \}/, contents)
    assert_match(/# fixtures :all/, contents)
  ensure
    FileUtils.rm_r "test/models"
  end
end
