require "minitest/autorun"
require "rails"

require "action_mailer/test_helper"
require "minitest/rails/action_mailer"
require "action_mailer"

class NotificationMailer < ActionMailer::Base; end
class Notifications < ActionMailer::Base; end

class TestActionMailerSpecType < MiniTest::Unit::TestCase
  def test_spec_type_resolves_for_class_constants
    assert_equal MiniTest::Spec.spec_type(NotificationMailer), MiniTest::Rails::ActionMailer::TestCase
    assert_equal MiniTest::Spec.spec_type(Notifications),      MiniTest::Rails::ActionMailer::TestCase
  end

  def test_spec_type_resolves_for_matching_strings
    assert_equal MiniTest::Spec.spec_type("WidgetMailer"), MiniTest::Rails::ActionMailer::TestCase
    assert_equal MiniTest::Spec.spec_type("WidgetMailerTest"), MiniTest::Rails::ActionMailer::TestCase
    assert_equal MiniTest::Spec.spec_type("Widget Mailer Test"), MiniTest::Rails::ActionMailer::TestCase
    # And is not case sensitive
    assert_equal MiniTest::Spec.spec_type("widgetmailer"), MiniTest::Rails::ActionMailer::TestCase
    assert_equal MiniTest::Spec.spec_type("widgetmailertest"), MiniTest::Rails::ActionMailer::TestCase
    assert_equal MiniTest::Spec.spec_type("widget mailer test"), MiniTest::Rails::ActionMailer::TestCase
  end

  def test_spec_type_wont_match_non_space_characters
    refute_equal MiniTest::Spec.spec_type("Widget Mailer\tTest"), MiniTest::Rails::ActionMailer::TestCase
    refute_equal MiniTest::Spec.spec_type("Widget Mailer\rTest"), MiniTest::Rails::ActionMailer::TestCase
    refute_equal MiniTest::Spec.spec_type("Widget Mailer\nTest"), MiniTest::Rails::ActionMailer::TestCase
    refute_equal MiniTest::Spec.spec_type("Widget Mailer\fTest"), MiniTest::Rails::ActionMailer::TestCase
    refute_equal MiniTest::Spec.spec_type("Widget MailerXTest"),  MiniTest::Rails::ActionMailer::TestCase
  end
end
