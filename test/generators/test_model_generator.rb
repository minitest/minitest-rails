require "helper"
require "generators/minitest/model/model_generator"

class TestModelGenerator < GeneratorTest
  tests Minitest::Generators::ModelGenerator

  def test_model_generator
    output = run_generator %w[user --no-spec]
    assert_match %r{create  test/models/user_test.rb}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/models/user_test.rb"

    contents = File.read "test/models/user_test.rb"
    assert_match(/class UserTest/m, contents)
  end

  def test_namespaced_model_generator
    output = run_generator %w[admin/user --no-spec]
    assert_match %r{create  test/models/admin/user_test.rb}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/models/admin/user_test.rb"

    contents = File.read "test/models/admin/user_test.rb"
    assert_match(/class Admin::UserTest/m, contents)
  end

  if Rails::Generators.respond_to? :namespace
    def test_module_namespaced_model_generator
      assert_nil Rails::Generators.namespace
      Rails::Generators.namespace = TestApp

      output = run_generator %w[user --no-spec]
      assert_match %r{create  test/models/test_app/user_test.rb}m, output

      Dir.chdir self.class.destination_root
      assert File.exist? "test/models/test_app/user_test.rb"

      contents = File.read "test/models/test_app/user_test.rb"
      assert_match(/module TestApp/m, contents)
      assert_match(/class UserTest/m, contents)
    ensure
      # Restore default namespace
      Rails::Generators.namespace = nil
    end
  end

  def test_model_generator_spec
    output = run_generator %w[user]
    assert_match %r{create  test/models/user_test.rb}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/models/user_test.rb"

    contents = File.read "test/models/user_test.rb"
    assert_match(/describe User do/m, contents)
  end

  def test_namespaced_model_generator_spec
    output = run_generator %w[admin/user]
    assert_match %r{create  test/models/admin/user_test.rb}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/models/admin/user_test.rb"

    contents = File.read "test/models/admin/user_test.rb"
    assert_match(/describe Admin::User do/m, contents)
  end

  def test_model_generator_fixture
    output = run_generator %w[user --fixture]
    assert_match %r{create  test/fixtures/users.yml}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/fixtures/users.yml"
  end

  def test_namespaced_model_generator_fixture
    output = run_generator %w[admin/user --fixture]
    assert_match %r{create  test/fixtures/admin/users.yml}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/fixtures/admin/users.yml"
  end

  def test_model_generator_skip_fixture
    output = run_generator %w[user --skip-fixture]
    refute_match %r{create  test/fixtures/users.yml}m, output

    Dir.chdir self.class.destination_root
    refute File.exist? "test/fixtures/users.yml"
  end
end
