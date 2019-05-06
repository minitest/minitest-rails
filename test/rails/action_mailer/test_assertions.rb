require "helper"

class TestActionMailerAssertions < ActionMailer::TestCase
  include ActiveSupport::Testing::Stream
  tests MyAppMailer

  def test_assert_emails
    assert_emails 1 do
      MyAppMailer.test.deliver_now
    end
  end

  def test_assert_no_emails
    assert_no_emails do
      MyAppMailer.test
    end
  end

  def test_refute_emails
    refute_emails do
      MyAppMailer.test
    end
  end

  def test_assert_enqueued_emails
    assert_enqueued_emails 1 do
      silence_stream($stdout) do
        MyAppMailer.test.deliver_later
      end
    end
  end

  def test_assert_no_enqueued_emails
    assert_no_enqueued_emails do
      MyAppMailer.test.deliver_now
    end
  end

  def test_refute_enqueued_emails
    refute_enqueued_emails do
      MyAppMailer.test.deliver_now
    end
  end
end
