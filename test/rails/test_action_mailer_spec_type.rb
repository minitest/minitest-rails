require "minitest/autorun"
require "rails"

require "action_mailer/test_helper"
require "minitest/rails/action_mailer"
require "action_mailer"

class NotificationMailer < ActionMailer::Base; end
class Notifications < ActionMailer::Base; end

class TestActionMailerSpecType < MiniTest::Unit::TestCase
  def test_spec_type_for_inherited_mailer_class
    assert_equal MiniTest::Spec.spec_type(NotificationMailer), MiniTest::Rails::ActionMailer::TestCase
    assert_equal MiniTest::Spec.spec_type(Notifications),      MiniTest::Rails::ActionMailer::TestCase
  end

  def test_spec_type_for_mailer_string
    assert_equal MiniTest::Spec.spec_type("WidgetMailer"), MiniTest::Rails::ActionMailer::TestCase
  end

  def test_spec_type_for_mailer__test_string
    assert_equal MiniTest::Spec.spec_type("WidgetMailerTest"), MiniTest::Rails::ActionMailer::TestCase
  end

  def test_spec_type_for_mailer_test_string
    assert_equal MiniTest::Spec.spec_type("Widget Mailer Test"), MiniTest::Rails::ActionMailer::TestCase
  end

  def test_spec_type_for_mailer_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widgetmailer"), MiniTest::Rails::ActionMailer::TestCase
  end

  def test_spec_type_for_mailer__test_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widgetmailertest"), MiniTest::Rails::ActionMailer::TestCase
  end

  def test_spec_type_for_mailer_test_case_insensitive_string
    assert_equal MiniTest::Spec.spec_type("widget mailer test"), MiniTest::Rails::ActionMailer::TestCase
  end
end
