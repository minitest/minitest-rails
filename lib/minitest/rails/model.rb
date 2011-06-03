require "minitest/rails/spec"
require "active_record/fixtures"

module MiniTest
  module Rails
    class Model < Spec
      include ActiveRecord::TestFixtures

      self.fixture_path = File.join(Rails.root, "test", "fixtures")
    end
  end
end
