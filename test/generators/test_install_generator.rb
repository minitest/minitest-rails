require "helper"
require "generators/minitest/install/install_generator"

class TestInstallGenerator < GeneratorTest
  tests Minitest::Generators::InstallGenerator

  def test_install_generator
    output = run_generator %w(myapp)
    assert_match /create  test\/test_helper.rb/m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/test_helper.rb"

    contents = File.read "test/test_helper.rb"
    assert_match(/require "rails\/test_help"/m, contents)
    assert_match(/require "minitest\/rails"/m, contents)
    assert_match(/fixtures :all/m, contents)
  end

  def test_install_generator_without_active_record
    output = run_generator %w(myapp --skip-active-record)
    assert_match /create  test\/test_helper.rb/m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/test_helper.rb"

    contents = File.read "test/test_helper.rb"
    assert_match(/require "rails\/test_help"/m, contents)
    assert_match(/require "minitest\/rails"/m, contents)
    refute_match(/fixtures :all/m, contents)
  end
end
