require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/mini_test/integration/integration_generator"

require "fileutils"

class TestIntegrationGenerator < MiniTest::Unit::TestCase
  Rails::Generators.no_color!

  def test_integration_generator
    text = capture(:stdout) do
      MiniTest::Generators::IntegrationGenerator.start ["user"]
    end
    assert_match(/create  test\/integration\/user_test.rb/m, text)
    assert File.exists? "test/integration/user_test.rb"
    contents = open("test/integration/user_test.rb").read
    assert_match(/class UserIntegrationTest < MiniTest::Rails::Integration/m, contents)
    assert_match(/def test_sanity/m, contents)
  ensure
    # TODO: Don"t write the files
    # I agree, it would be better to mock the file getting written
    FileUtils.rm_r "test/integration"
  end

  def test_integration_generator_spec
    text = capture(:stdout) do
      MiniTest::Generators::IntegrationGenerator.start ["user", "--spec"]
    end
    assert_match(/create  test\/integration\/user_test.rb/m, text)
    assert File.exists? "test/integration/user_test.rb"
    contents = open("test/integration/user_test.rb").read
    assert_match(/describe "User Integration Test" do/m, contents)
    assert_match(/# fixtures :all/m, contents)
    assert_match(/it "must be a real test"/m, contents)
  ensure
    FileUtils.rm_r "test/integration"
  end
end
