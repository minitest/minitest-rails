module MiniTest
  module Rails
    module Fixtures
      def self.included(klass)
        klass.class_eval do
          include ActiveSupport::Testing::SetupAndTeardown
          include ActiveRecord::TestFixtures
          self.fixture_path = File.join(::Rails.root, "test", "fixtures")
        end
      end
    end
  end
end

