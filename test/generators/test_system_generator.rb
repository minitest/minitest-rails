require "helper"
require "generators/minitest/system/system_generator"

class TestSystemGenerator < GeneratorTest
  tests Minitest::Generators::SystemGenerator

  def test_system_generator
    output = run_generator %w[Widget --no-spec]
    assert_match %r{create  test/system/widgets_test.rb}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/system/widgets_test.rb"

    contents = File.read "test/system/widgets_test.rb"
    assert_match(/class WidgetsTest < ApplicationSystemTestCase/m, contents)
    assert_match(/visit widgets_url/m, contents)
  end

  def test_system_generator_spec
    output = run_generator %w[Widget --spec]
    assert_match %r{create  test/system/widgets_test.rb}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/system/widgets_test.rb"

    contents = File.read "test/system/widgets_test.rb"
    assert_match(/describe Widgets, :system do/m, contents)
    assert_match(/visit widgets_url/m, contents)
  end
end
