require "minitest/rails/active_support"
require "action_mailer/test_case"

module MiniTest
  module Rails
    module ActionMailer
      class TestCase < MiniTest::Rails::ActiveSupport::TestCase
        # Use AM::TestCase for the base class when describing a mailer
        register_spec_type(self) do |desc|
          desc.respond_to?(:ancestors) && desc.ancestors.include?(ActionMailer::Base)
        end

        include ::ActionMailer::TestCase::Behavior
      end
    end
  end
end
