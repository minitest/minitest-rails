require "helper"
require "generators/minitest/generator/generator_generator"

class TestGeneratorGenerator < GeneratorTest
  tests Minitest::Generators::GeneratorGenerator

  def test_generator_generator
    output = run_generator %w[awesome --no-spec]
    assert_match %r{create  test/lib/generators/awesome_generator_test.rb}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/lib/generators/awesome_generator_test.rb"

    contents = File.read "test/lib/generators/awesome_generator_test.rb"
    assert_match(/class AwesomeGeneratorTest/m, contents)
  end

  def test_namespaced_generator_generator
    output = run_generator %w[rails/awesome --no-spec]
    assert_match %r{create  test/lib/generators/rails/awesome_generator_test.rb}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/lib/generators/rails/awesome_generator_test.rb"

    contents = File.read "test/lib/generators/rails/awesome_generator_test.rb"
    assert_match(/class Rails::AwesomeGeneratorTest/m, contents)
  end

  if Rails::Generators.respond_to? :namespace
    def test_module_namespaced_generator_generator
      assert_nil Rails::Generators.namespace
      Rails::Generators.namespace = TestApp

      output = run_generator %w[awesome --no-spec]
      assert_match %r{create  test/lib/generators/test_app/awesome_generator_test.rb}m, output

      Dir.chdir self.class.destination_root
      assert File.exist? "test/lib/generators/test_app/awesome_generator_test.rb"

      contents = File.read "test/lib/generators/test_app/awesome_generator_test.rb"
      assert_match(/module TestApp/m, contents)
      assert_match(/class AwesomeGeneratorTest/m, contents)
    ensure
      # Restore default namespace
      Rails::Generators.namespace = nil
    end
  end

  def test_generator_generator_spec
    output = run_generator %w[awesome]
    assert_match %r{create  test/lib/generators/awesome_generator_test.rb}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/lib/generators/awesome_generator_test.rb"
    contents = File.read "test/lib/generators/awesome_generator_test.rb"
    assert_match(/describe AwesomeGenerator do/m, contents)
  end

  def test_namespaced_generator_generator_spec
    output = run_generator %w[rails/awesome]
    assert_match %r{create  test/lib/generators/rails/awesome_generator_test.rb}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/lib/generators/rails/awesome_generator_test.rb"

    contents = File.read "test/lib/generators/rails/awesome_generator_test.rb"
    assert_match(/describe Rails::AwesomeGenerator do/m, contents)
  end
end
