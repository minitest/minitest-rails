require "minitest/autorun"
require "minitest/rails"

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

class MiniTest::Rails::Spec

  # Add methods to be used by all specs here...

end

# Uncomment to support fixtures in Model tests...
# require "active_record/fixtures"
class MiniTest::Rails::Model
  # include ActiveRecord::TestFixtures
  # self.fixture_path = File.join(Rails.root, "test", "fixtures")
end
