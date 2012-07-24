require "minitest/rails/active_support"
require "action_mailer/test_case"

module MiniTest
  module Rails
    module ActionMailer
      class TestCase < MiniTest::Rails::ActiveSupport::TestCase
        include ::ActionMailer::TestCase::Behavior

        # Use AM::TestCase for the base class when describing a mailer
        register_spec_type(self) do |desc|
          desc < ::ActionMailer::Base if desc.is_a?(Class)
        end
        register_spec_type(/Mailer(\s?Test)?$/, self)
      end
    end
  end
end
