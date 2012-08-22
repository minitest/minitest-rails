require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/mini_test/mailer/mailer_generator"

require "fakefs/safe"

class FakeFS::File
  def self.binread file
    File.open(file, "rb") { |f| f.read }
  end
end

class TestMailerGenerator < MiniTest::Unit::TestCase
  def setup
    Rails::Generators.no_color!
    FakeFS.activate!
    FakeFS::FileSystem.clone "lib/generators"
  end

  def teardown
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end

  def test_mailer_generator
    out, err = capture_io do
      MiniTest::Generators::MailerGenerator.start ["notification"]
    end
    assert_match(/create  test\/mailers\/notification_test.rb/m, out)
    assert File.exists? "test/mailers/notification_test.rb"
    contents = File.read "test/mailers/notification_test.rb"
    assert_match(/class NotificationTest/m, contents)
  end

  def test_mailer_generator_spec
    out, err = capture_io do
      MiniTest::Generators::MailerGenerator.start ["notification", "welcome", "--spec"]
    end
    assert_match(/create  spec\/mailers\/notification_spec.rb/m, out)
    assert File.exists? "spec/mailers/notification_spec.rb"
    contents = File.read "spec/mailers/notification_spec.rb"
    assert_match(/describe Notification do/m, contents)
  end
end
