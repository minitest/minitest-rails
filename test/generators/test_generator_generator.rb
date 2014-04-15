require "helper"
require "generators/minitest/generator/generator_generator"

class TestGeneratorGenerator < GeneratorTest

  def test_generator_generator
    assert_output(/create  test\/lib\/generators\/awesome_generator_test.rb/m) do
      Minitest::Generators::GeneratorGenerator.start ["awesome"]
    end
    assert File.exists? "test/lib/generators/awesome_generator_test.rb"
    contents = File.read "test/lib/generators/awesome_generator_test.rb"
    assert_match(/class AwesomeGeneratorTest/m, contents)
  end

  def test_namespaced_generator_generator
    assert_output(/create  test\/lib\/generators\/rails\/awesome_generator_test.rb/m) do
      Minitest::Generators::GeneratorGenerator.start ["rails/awesome"]
    end
    assert File.exists? "test/lib/generators/rails/awesome_generator_test.rb"
    contents = File.read "test/lib/generators/rails/awesome_generator_test.rb"
    assert_match(/class Rails::AwesomeGeneratorTest/m, contents)
  end

  def test_module_namespaced_generator_generator
    assert_nil Rails::Generators.namespace
    Rails::Generators.namespace = TestApp

    assert_output(/create  test\/lib\/generators\/test_app\/awesome_generator_test.rb/m) do
      Minitest::Generators::GeneratorGenerator.start ["awesome"]
    end
    assert File.exists? "test/lib/generators/test_app/awesome_generator_test.rb"
    contents = File.read "test/lib/generators/test_app/awesome_generator_test.rb"
    assert_match(/module TestApp/m, contents)
    assert_match(/class AwesomeGeneratorTest/m, contents)
  ensure
    # Restore default namespace
    Rails::Generators.namespace = nil
  end if Rails::Generators.respond_to? :namespace

  def test_generator_generator_spec
    assert_output(/create  test\/lib\/generators\/awesome_generator_test.rb/m) do
      Minitest::Generators::GeneratorGenerator.start ["awesome", "--spec"]
    end
    assert File.exists? "test/lib/generators/awesome_generator_test.rb"
    contents = File.read "test/lib/generators/awesome_generator_test.rb"
    assert_match(/describe AwesomeGenerator do/m, contents)
  end

  def test_namespaced_generator_generator_spec
    assert_output(/create  test\/lib\/generators\/rails\/awesome_generator_test.rb/m) do
      Minitest::Generators::GeneratorGenerator.start ["rails/awesome", "--spec"]
    end
    assert File.exists? "test/lib/generators/rails/awesome_generator_test.rb"
    contents = File.read "test/lib/generators/rails/awesome_generator_test.rb"
    assert_match(/describe Rails::AwesomeGenerator do/m, contents)
  end

end
