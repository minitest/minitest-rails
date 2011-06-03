require "minitest/rails/base"
# require "active_support/testing/setup_and_teardown"
# require "active_record/fixtures"

module MiniTest
  module Rails
    class ModelTestCase < TestCase
      # include ActiveSupport::Testing::SetupAndTeardown
      # include ActiveRecord::TestFixtures
      #
      # self.fixture_path = File.join(Rails.root, "test", "fixtures")
    end

    class ModelSpec < Spec
    end
  end
end
