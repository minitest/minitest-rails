require "helper"

class NotificationMailer < ActionMailer::Base; end
class Notifications < ActionMailer::Base; end

class TestActionMailerSpecType < Minitest::Test
  def assert_mailer actual
    assert_equal ActionMailer::TestCase, actual
  end

  def refute_mailer actual
    refute_equal ActionMailer::TestCase, actual
  end

  def test_spec_type_resolves_for_class_constants
    assert_mailer Minitest::Spec.spec_type(NotificationMailer)
    assert_mailer Minitest::Spec.spec_type(Notifications)
  end

  def test_spec_type_resolves_for_matching_strings
    assert_mailer Minitest::Spec.spec_type("WidgetMailer")
    assert_mailer Minitest::Spec.spec_type("WidgetMailerTest")
    assert_mailer Minitest::Spec.spec_type("Widget Mailer Test")
    # And is not case sensitive
    assert_mailer Minitest::Spec.spec_type("widgetmailer")
    assert_mailer Minitest::Spec.spec_type("widgetmailertest")
    assert_mailer Minitest::Spec.spec_type("widget mailer test")
  end

  def test_spec_type_wont_match_non_space_characters
    refute_mailer Minitest::Spec.spec_type("Widget Mailer\tTest")
    refute_mailer Minitest::Spec.spec_type("Widget Mailer\rTest")
    refute_mailer Minitest::Spec.spec_type("Widget Mailer\nTest")
    refute_mailer Minitest::Spec.spec_type("Widget Mailer\fTest")
    refute_mailer Minitest::Spec.spec_type("Widget MailerXTest")
  end

  def test_spec_type_doesnt_resolve_random_strings
    refute_mailer Minitest::Spec.spec_type("Unmatched String")
  end

  def test_spec_type_resolves_for_additional_desc_mailer
    assert_mailer Minitest::Spec.spec_type("Unmatched String", :mailer)
    assert_mailer Minitest::Spec.spec_type("Unmatched String", :mailer, :other)
    assert_mailer Minitest::Spec.spec_type("Unmatched String", :other, :mailer)
  end
end
