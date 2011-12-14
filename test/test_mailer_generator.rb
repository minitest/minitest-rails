require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/mini_test/mailer/mailer_generator"

require "fileutils"

class TestMailerGenerator < MiniTest::Unit::TestCase
  Rails::Generators.no_color!

  def test_mailer_generator
    text = capture(:stdout) do
      MiniTest::Generators::MailerGenerator.start ["notification"]
    end
    assert_match(/create  test\/mailers\/notification_test.rb/m, text)
    assert File.exists? "test/mailers/notification_test.rb"
    contents = open("test/mailers/notification_test.rb").read
    assert_match(/class NotificationTest < MiniTest::Rails::Mailer/m, contents)
  ensure
    # TODO: Don"t write the files
    # I agree, it would be better to mock the file getting written
    FileUtils.rm_r "test/mailers"
  end

  def test_mailer_generator_spec
    text = capture(:stdout) do
      MiniTest::Generators::MailerGenerator.start ["notification", "welcome", "--spec"]
    end
    assert_match(/create  test\/mailers\/notification_test.rb/m, text)
    assert File.exists? "test/mailers/notification_test.rb"
    contents = open("test/mailers/notification_test.rb").read
    assert_match(/describe Notification do/m, contents)
    assert_match(/it "welcome" do/m, contents)
  ensure
    FileUtils.rm_r "test/mailers"
  end
end
