require "helper"
require "generators/minitest/mailer/mailer_generator"

class TestMailerGenerator < GeneratorTest
  tests Minitest::Generators::MailerGenerator

  def test_mailer_generator
    output = run_generator %w(notification welcome --no-spec)
    assert_match /create  test\/mailers\/notification_mailer_test.rb/m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/mailers/notification_mailer_test.rb"

    contents = File.read "test/mailers/notification_mailer_test.rb"
    assert_match(/class NotificationMailerTest/m, contents)
    assert_match(/def test_welcome/m, contents)
  end

  def test_namespaced_mailer_generator
    output = run_generator %w(admin/notification welcome --no-spec)
    assert_match /create  test\/mailers\/admin\/notification_mailer_test.rb/m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/mailers/admin/notification_mailer_test.rb"

    contents = File.read "test/mailers/admin/notification_mailer_test.rb"
    assert_match(/class Admin::NotificationMailerTest/m, contents)
    assert_match(/def test_welcome/m, contents)
  end

  def test_mailer_generator_spec
    output = run_generator %w(notification welcome)
    assert_match /create  test\/mailers\/notification_mailer_test.rb/m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/mailers/notification_mailer_test.rb"

    contents = File.read "test/mailers/notification_mailer_test.rb"
    assert_match(/describe NotificationMailer do/m, contents)
    assert_match(/it "creates welcome email"/m, contents)
  end

  def test_namespaced_mailer_generator_spec
    output = run_generator %w(admin/notification welcome)
    assert_match /create  test\/mailers\/admin\/notification_mailer_test.rb/m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/mailers/admin/notification_mailer_test.rb"

    contents = File.read "test/mailers/admin/notification_mailer_test.rb"
    assert_match(/describe Admin::NotificationMailer do/m, contents)
    assert_match(/it "creates welcome email"/m, contents)
  end
end
