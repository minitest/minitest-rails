require "helper"
require "generators/mini_test/install/install_generator"

class TestInstallGenerator < GeneratorTest

  def test_install_generator
    assert_output(/create  test\/minitest_helper.rb/m) do
      MiniTest::Generators::InstallGenerator.start
    end
    assert File.exists? "test/minitest_helper.rb"
    contents = File.read "test/minitest_helper.rb"
    assert_match(/require "minitest\/autorun"/m, contents)
    assert_match(/require "minitest\/rails"/m, contents)
  end

end
