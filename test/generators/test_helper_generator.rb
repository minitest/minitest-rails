require "helper"
require "generators/minitest/helper/helper_generator"

class TestHelperGenerator < GeneratorTest
  tests Minitest::Generators::HelperGenerator

  def test_helper_generator
    output = run_generator %w(user --no-spec)
    refute_match /create  test\/helpers\/user_helper_test.rb/m, output

    Dir.chdir self.class.destination_root
    refute File.exist? "test/helpers/user_helper_test.rb"
  end

  def test_namespaced_helper_generator
    output = run_generator %w(admin/user --no-spec)
    refute_match /create  test\/helpers\/user_helper_test.rb/m, output

    Dir.chdir self.class.destination_root
    refute File.exist? "test/helpers/admin/user_helper_test.rb"
  end

  def test_helper_generator_spec
    output = run_generator %w(user)
    refute_match /create  test\/helpers\/user_helper_test.rb/m, output

    Dir.chdir self.class.destination_root
    refute File.exist? "test/helpers/user_helper_test.rb"
  end

  def test_namespaced_helper_generator_spec
    output = run_generator %w(admin/user)
    refute_match /create  test\/helpers\/user_helper_test.rb/m, output

    Dir.chdir self.class.destination_root
    refute File.exist? "test/helpers/admin/user_helper_test.rb"
  end

end
