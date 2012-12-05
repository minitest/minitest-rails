require "minitest/autorun"
require "rails"

require "action_mailer/test_helper"
require "minitest/rails/action_mailer"
require "action_mailer"

class NotificationMailer < ActionMailer::Base; end
class Notifications < ActionMailer::Base; end

class TestActionMailerSpecType < MiniTest::Unit::TestCase
  def assert_mailer actual
    assert_equal MiniTest::Rails::ActionMailer::TestCase, actual
  end

  def refute_mailer actual
    refute_equal MiniTest::Rails::ActionMailer::TestCase, actual
  end

  def test_spec_type_resolves_for_class_constants
    assert_mailer MiniTest::Spec.spec_type(NotificationMailer)
    assert_mailer MiniTest::Spec.spec_type(Notifications)
  end

  def test_spec_type_resolves_for_matching_strings
    assert_mailer MiniTest::Spec.spec_type("WidgetMailer")
    assert_mailer MiniTest::Spec.spec_type("WidgetMailerTest")
    assert_mailer MiniTest::Spec.spec_type("Widget Mailer Test")
  end

  def test_spec_type_wont_match_non_space_characters
    refute_mailer MiniTest::Spec.spec_type("Widget Mailer\tTest")
    refute_mailer MiniTest::Spec.spec_type("Widget Mailer\rTest")
    refute_mailer MiniTest::Spec.spec_type("Widget Mailer\nTest")
    refute_mailer MiniTest::Spec.spec_type("Widget Mailer\fTest")
    refute_mailer MiniTest::Spec.spec_type("Widget MailerXTest")
  end

  def test_spec_type_wont_match_non_mailer_strings
    refute_mailer MiniTest::Spec.spec_type("MailerrorTest")
    refute_mailer MiniTest::Spec.spec_type("MailErrorTest")
    refute_mailer MiniTest::Spec.spec_type("WidgetMailerWidgetTest")
    refute_mailer MiniTest::Spec.spec_type("Widget Mailer Widget Test")
  end
end
