require "helper"
require "generators/minitest/helper/helper_generator"

class TestHelperGenerator < GeneratorTest

  def test_helper_generator
    refute_output(/create  test\/helpers\/user_helper_test.rb/m) do
      Minitest::Generators::HelperGenerator.start ["user", "--no-spec"]
    end
    refute File.exists? "test/helpers/user_helper_test.rb"
  end

  def test_namespaced_helper_generator
    refute_output(/create  test\/helpers\/admin\/user_helper_test.rb/m) do
      Minitest::Generators::HelperGenerator.start ["admin/user", "--no-spec"]
    end
    refute File.exists? "test/helpers/admin/user_helper_test.rb"
  end

  def test_helper_generator_spec
    refute_output(/create  test\/helpers\/user_helper_test.rb/m) do
      Minitest::Generators::HelperGenerator.start ["user"]
    end
    refute File.exists? "test/helpers/user_helper_test.rb"
  end

  def test_namespaced_helper_generator_spec
    refute_output(/create  test\/helpers\/admin\/user_helper_test.rb/m) do
      Minitest::Generators::HelperGenerator.start ["admin/user"]
    end
    refute File.exists? "test/helpers/admin/user_helper_test.rb"
  end

end
