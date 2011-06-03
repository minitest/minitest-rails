require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/mini_test/helper/helper_generator"

require "fileutils"

class TestHelperGenerator < MiniTest::Unit::TestCase
  Rails::Generators.no_color!

  def test_helper_generator
    text = capture(:stdout) do
      MiniTest::Generators::HelperGenerator.start ["user"]
    end
    assert_match(/create  test\/helpers\/user_helper_test.rb/m, text)
    assert File.exists? "test/helpers/user_helper_test.rb"
    contents = open("test/helpers/user_helper_test.rb").read
    assert_match(/class UserHelperTest < MiniTest::Rails::HelperTestCase/m, contents)
  ensure
    # TODO: Don"t write the files
    # I agree, it would be better to mock the file getting written
    FileUtils.rm_r "test/helpers"
  end

  def test_helper_generator_spec
    text = capture(:stdout) do
      MiniTest::Generators::HelperGenerator.start ["user", "--spec"]
    end
    assert_match(/create  test\/helpers\/user_helper_test.rb/m, text)
    assert File.exists? "test/helpers/user_helper_test.rb"
    contents = open("test/helpers/user_helper_test.rb").read
    assert_match(/describe UserHelper do/m, contents)
  ensure
    FileUtils.rm_r "test/helpers"
  end
end
