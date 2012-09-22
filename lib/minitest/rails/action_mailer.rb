require "minitest/rails/active_support"
require "action_mailer/test_case"

module MiniTest
  module Rails
    module ActionMailer
      class TestCase < MiniTest::Rails::ActiveSupport::TestCase
        # Use AM::TestCase for the base class when describing a mailer
        register_spec_type(self) do |desc|
          desc < ::ActionMailer::Base if desc.is_a?(Class)
        end
        register_spec_type(/Mailer( ?Test)?\z/i, self)

        include ::ActionMailer::TestCase::Behavior

        def self.determine_default_mailer(name)
          mailer = determine_constant_from_test_name(name) do |constant|
            Class === constant && constant < ::ActionMailer::Base
          end
          raise ::ActionMailer::NonInferrableMailerError.new(name) if mailer.nil?
          mailer
        end
      end
    end
  end
end
