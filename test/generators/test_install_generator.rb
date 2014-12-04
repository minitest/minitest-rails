require "helper"
require "generators/minitest/install/install_generator"

class TestInstallGenerator < GeneratorTest

  def test_install_generator
    assert_output(/create  test\/test_helper.rb/m) do
      Minitest::Generators::InstallGenerator.start
    end
    assert File.exists? "test/test_helper.rb"
    contents = File.read "test/test_helper.rb"
    assert_match(/require "rails\/test_help"/m, contents)
    assert_match(/require "minitest\/rails"/m, contents)
    assert_match(/fixtures :all/m, contents)
  end

  def test_install_generator_without_active_record
    assert_output(/create  test\/test_helper.rb/m) do
      Minitest::Generators::InstallGenerator.start ["--skip-active-record"]
    end
    assert File.exists? "test/test_helper.rb"
    contents = File.read "test/test_helper.rb"
    assert_match(/require "rails\/test_help"/m, contents)
    assert_match(/require "minitest\/rails"/m, contents)
    refute_match(/fixtures :all/m, contents)
  end
end
