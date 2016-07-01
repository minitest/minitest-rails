require "helper"
require "generators/minitest/mailer/mailer_generator"

class TestMailerGenerator < GeneratorTest

  def test_mailer_generator
    assert_output(/create  test\/mailers\/notification_mailer_test.rb/m) do
      Minitest::Generators::MailerGenerator.start ["notification", "--no-spec"]
    end
    assert File.exists? "test/mailers/notification_mailer_test.rb"
    contents = File.read "test/mailers/notification_mailer_test.rb"
    assert_match(/class NotificationMailerTest/m, contents)
  end

  def test_namespaced_mailer_generator
    assert_output(/create  test\/mailers\/admin\/notification_mailer_test.rb/m) do
      Minitest::Generators::MailerGenerator.start ["admin/notification", "--no-spec"]
    end
    assert File.exists? "test/mailers/admin/notification_mailer_test.rb"
    contents = File.read "test/mailers/admin/notification_mailer_test.rb"
    assert_match(/class Admin::NotificationMailerTest/m, contents)
  end

  def test_mailer_generator_spec
    assert_output(/create  test\/mailers\/notification_mailer_test.rb/m) do
      Minitest::Generators::MailerGenerator.start ["notification", "welcome"]
    end
    assert File.exists? "test/mailers/notification_mailer_test.rb"
    contents = File.read "test/mailers/notification_mailer_test.rb"
    assert_match(/describe NotificationMailer do/m, contents)
  end

  def test_namespaced_mailer_generator_spec
    assert_output(/create  test\/mailers\/admin\/notification_mailer_test.rb/m) do
      Minitest::Generators::MailerGenerator.start ["admin/notification", "welcome"]
    end
    assert File.exists? "test/mailers/admin/notification_mailer_test.rb"
    contents = File.read "test/mailers/admin/notification_mailer_test.rb"
    assert_match(/describe Admin::NotificationMailer do/m, contents)
  end

end
