require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/mini_test/helper/helper_generator"

require "fakefs/safe"

class FakeFS::File
  def self.binread file
    File.open(file, "rb") { |f| f.read }
  end
end

class TestHelperGenerator < MiniTest::Unit::TestCase
  def setup
    Rails::Generators.no_color!
    FakeFS.activate!
    FakeFS::FileSystem.clone "lib/generators"
  end

  def teardown
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end

  def test_helper_generator
    out, err = capture_io do
      MiniTest::Generators::HelperGenerator.start ["user"]
    end
    assert_match(/create  test\/helpers\/user_helper_test.rb/m, out)
    assert File.exists? "test/helpers/user_helper_test.rb"
    contents = File.read "test/helpers/user_helper_test.rb"
    assert_match(/class UserHelperTest < MiniTest::Rails::ActionView::TestCase/m, contents)
  end

  def test_namespaced_helper_generator
    out, err = capture_io do
      MiniTest::Generators::HelperGenerator.start ["admin/user"]
    end
    assert_match(/create  test\/helpers\/admin\/user_helper_test.rb/m, out)
    assert File.exists? "test/helpers/admin/user_helper_test.rb"
    contents = File.read "test/helpers/admin/user_helper_test.rb"
    assert_match(/class Admin::UserHelperTest < MiniTest::Rails::ActionView::TestCase/m, contents)
  end

  def test_helper_generator_spec
    out, err = capture_io do
      MiniTest::Generators::HelperGenerator.start ["user", "--spec"]
    end
    assert_match(/create  spec\/helpers\/user_helper_spec.rb/m, out)
    assert File.exists? "spec/helpers/user_helper_spec.rb"
    contents = File.read "spec/helpers/user_helper_spec.rb"
    assert_match(/describe UserHelper do/m, contents)
  end

  def test_namespaced_helper_generator_spec
    out, err = capture_io do
      MiniTest::Generators::HelperGenerator.start ["admin/user", "--spec"]
    end
    assert_match(/create  spec\/helpers\/admin\/user_helper_spec.rb/m, out)
    assert File.exists? "spec/helpers/admin/user_helper_spec.rb"
    contents = File.read "spec/helpers/admin/user_helper_spec.rb"
    assert_match(/describe Admin::UserHelper do/m, contents)
  end

end
