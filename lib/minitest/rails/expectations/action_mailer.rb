require "active_support/concern"

module Minitest
  module Rails
    module Expectations
      module ActionMailer
        ##
        # Asserts that the number of emails sent matches the given number.
        #
        #   def test_emails
        #     must_have_emails 0
        #     ContactMailer.welcome.deliver_now
        #     must_have_emails 1
        #     ContactMailer.welcome.deliver_now
        #     must_have_emails 2
        #   end
        #
        # If a block is passed, that block should cause the specified number of
        # emails to be sent.
        #
        #   def test_emails_again
        #     must_have_emails 1 do
        #       ContactMailer.welcome.deliver_now
        #     end
        #
        #     must_have_emails 2 do
        #       ContactMailer.welcome.deliver_now
        #       ContactMailer.welcome.deliver_later
        #     end
        #   end
        #
        # See also ActionMailer::TestClass#assert_emails
        # See https://api.rubyonrails.org/v5.1/classes/ActionMailer/TestHelper.html#method-i-assert_emails
        #
        # :method: must_have_emails
        # :call-seq: must_have_emails(number, &block)

        # Asserts that no emails have been sent.
        #
        #   def test_emails
        #     wont_have_emails
        #     ContactMailer.welcome.deliver_now
        #     must_have_emails 1
        #   end
        #
        # If a block is passed, that block should not cause any emails to be sent.
        #
        #   def test_emails_again
        #     wont_have_emails do
        #       # No emails should be sent from this block
        #     end
        #   end
        #
        # Note: This assertion is simply a shortcut for:
        #
        #   must_have_emails 0, &block
        #
        # See also ActionMailer::TestClass#wont_have_emails
        # See https://api.rubyonrails.org/v5.1/classes/ActionMailer/TestHelper.html#method-i-assert_no_emails
        #
        # :method: wont_have_emails
        # :call-seq: wont_have_emails(&block)

        ##
        # Asserts that the number of emails enqueued for later delivery matches
        # the given number.
        #
        #   def test_emails
        #     must_have_enqueued_emails 0
        #     ContactMailer.welcome.deliver_later
        #     must_have_enqueued_emails 1
        #     ContactMailer.welcome.deliver_later
        #     must_have_enqueued_emails 2
        #   end
        #
        # If a block is passed, that block should cause the specified number of
        # emails to be enqueued.
        #
        #   def test_emails_again
        #     must_have_enqueued_emails 1 do
        #       ContactMailer.welcome.deliver_later
        #     end
        #
        #     must_have_enqueued_emails 2 do
        #       ContactMailer.welcome.deliver_later
        #       ContactMailer.welcome.deliver_later
        #     end
        #   end
        #
        # See also ActionMailer::TestClass#assert_enqueued_emails
        # See https://api.rubyonrails.org/v5.1/classes/ActionMailer/TestHelper.html#method-i-assert_enqueued_emails
        #
        # :method: must_have_enqueued_emails
        # :call-seq: must_have_enqueued_emails(number, &block)

        ##
        # Asserts that no emails are enqueued for later delivery.
        #
        #   def test_no_emails
        #     wont_have_enqueued_emails
        #     ContactMailer.welcome.deliver_later
        #     wont_have_enqueued_emails 1
        #   end
        #
        # If a block is provided, it should not cause any emails to be enqueued.
        #
        #   def test_no_emails
        #     wont_have_enqueued_emails do
        #       # No emails should be enqueued from this block
        #     end
        #   end
        #
        # See also ActionMailer::TestClass#assert_no_enqueued_emails
        # See https://api.rubyonrails.org/v5.1/classes/ActionMailer/TestHelper.html#method-i-assert_no_enqueued_emails
        #
        # :method: wont_have_enqueued_emails
        # :call-seq: wont_have_enqueued_emails(&block)

        extend ::ActiveSupport::Concern

        included do
          alias_method :must_have_emails, :assert_emails
          alias_method :wont_have_emails, :assert_no_emails
          alias_method :must_have_enqueued_emails, :assert_enqueued_emails
          alias_method :wont_have_enqueued_emails, :assert_no_enqueued_emails
        end
      end
    end
  end
end

unless ENV["MT_NO_EXPECTATIONS"]
  class ActionMailer::TestCase # :nodoc:
    include Minitest::Rails::Expectations::ActionMailer
  end
end
