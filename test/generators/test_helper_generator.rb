require "helper"
require "generators/minitest/helper/helper_generator"

class TestHelperGenerator < GeneratorTest

  def test_helper_generator
    assert_output(/create  test\/helpers\/user_helper_test.rb/m) do
      Minitest::Generators::HelperGenerator.start ["user"]
    end
    assert File.exists? "test/helpers/user_helper_test.rb"
    contents = File.read "test/helpers/user_helper_test.rb"
    assert_match(/class UserHelperTest < ActionView::TestCase/m, contents)
  end

  def test_namespaced_helper_generator
    assert_output(/create  test\/helpers\/admin\/user_helper_test.rb/m) do
      Minitest::Generators::HelperGenerator.start ["admin/user"]
    end
    assert File.exists? "test/helpers/admin/user_helper_test.rb"
    contents = File.read "test/helpers/admin/user_helper_test.rb"
    assert_match(/class Admin::UserHelperTest < ActionView::TestCase/m, contents)
  end

  def test_helper_generator_spec
    assert_output(/create  test\/helpers\/user_helper_test.rb/m) do
      Minitest::Generators::HelperGenerator.start ["user", "--spec"]
    end
    assert File.exists? "test/helpers/user_helper_test.rb"
    contents = File.read "test/helpers/user_helper_test.rb"
    assert_match(/describe UserHelper do/m, contents)
  end

  def test_namespaced_helper_generator_spec
    assert_output(/create  test\/helpers\/admin\/user_helper_test.rb/m) do
      Minitest::Generators::HelperGenerator.start ["admin/user", "--spec"]
    end
    assert File.exists? "test/helpers/admin/user_helper_test.rb"
    contents = File.read "test/helpers/admin/user_helper_test.rb"
    assert_match(/describe Admin::UserHelper do/m, contents)
  end

end
