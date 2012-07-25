require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/mini_test/install/install_generator"

require "fileutils"

class TestInstallGenerator < MiniTest::Unit::TestCase
  Rails::Generators.no_color!

  def test_install_generator
    text = capture(:stdout) do
      MiniTest::Generators::InstallGenerator.start
    end
    assert_match(/create  test\/minitest_helper.rb/m, text)
    assert File.exists? "test/minitest_helper.rb"
    contents = open("test/minitest_helper.rb").read
    assert_match(/require "minitest\/autorun"/m, contents)
    assert_match(/require "minitest\/rails"/m, contents)
  ensure
    # TODO: Don"t write the files
    # I agree, it would be better to mock the file getting written
    FileUtils.rm "test/minitest_helper.rb"
  end
end
