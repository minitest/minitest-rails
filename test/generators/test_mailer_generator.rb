require "helper"
require "generators/minitest/mailer/mailer_generator"

class TestMailerGenerator < GeneratorTest

  def test_mailer_generator
    assert_output(/create  test\/mailers\/notification_test.rb/m) do
      Minitest::Generators::MailerGenerator.start ["notification"]
    end
    assert File.exists? "test/mailers/notification_test.rb"
    contents = File.read "test/mailers/notification_test.rb"
    assert_match(/class NotificationTest/m, contents)
  end

  def test_namespaced_mailer_generator
    assert_output(/create  test\/mailers\/admin\/notification_test.rb/m) do
      Minitest::Generators::MailerGenerator.start ["admin/notification"]
    end
    assert File.exists? "test/mailers/admin/notification_test.rb"
    contents = File.read "test/mailers/admin/notification_test.rb"
    assert_match(/class Admin::NotificationTest/m, contents)
  end

  def test_mailer_generator_spec
    assert_output(/create  test\/mailers\/notification_test.rb/m) do
      Minitest::Generators::MailerGenerator.start ["notification", "welcome", "--spec"]
    end
    assert File.exists? "test/mailers/notification_test.rb"
    contents = File.read "test/mailers/notification_test.rb"
    assert_match(/describe Notification do/m, contents)
  end

  def test_namespaced_mailer_generator_spec
    assert_output(/create  test\/mailers\/admin\/notification_test.rb/m) do
      Minitest::Generators::MailerGenerator.start ["admin/notification", "welcome", "--spec"]
    end
    assert File.exists? "test/mailers/admin/notification_test.rb"
    contents = File.read "test/mailers/admin/notification_test.rb"
    assert_match(/describe Admin::Notification do/m, contents)
  end


end
