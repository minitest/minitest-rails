require "helper"

class TestActionMailerExpectations < ActionMailer::TestCase
  include ActiveSupport::Testing::Stream
  tests MyAppMailer

  def test_must_have_emails
    must_have_emails 1 do
      MyAppMailer.test.deliver_now
    end
  end

  def test_wont_have_emails
    wont_have_emails do
      MyAppMailer.test
    end
  end

  def test_must_have_enqueued_emails
    must_have_enqueued_emails 1 do
      silence_stream($stdout) do
        MyAppMailer.test.deliver_later
      end
    end
  end

  def test_wont_have_enqueued_emails
    wont_have_enqueued_emails do
      MyAppMailer.test.deliver_now
    end
  end
end
