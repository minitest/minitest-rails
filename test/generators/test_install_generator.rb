require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/mini_test/install/install_generator"

require "fakefs/safe"

class FakeFS::File
  def self.binread file
    File.open(file, "rb") { |f| f.read }
  end
end

class TestInstallGenerator < MiniTest::Unit::TestCase
  def setup
    Rails::Generators.no_color!
    FakeFS.activate!
    FakeFS::FileSystem.clone "lib/generators"
  end

  def teardown
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end

  def test_install_generator
    text = capture :stdout do
      MiniTest::Generators::InstallGenerator.start
    end
    assert_match /create  test\/minitest_helper.rb/m, text
    assert File.exists? "test/minitest_helper.rb"
    contents = File.read "test/minitest_helper.rb"
    assert_match /require "minitest\/autorun"/m, contents
    assert_match /require "minitest\/rails"/m, contents
  end
end
