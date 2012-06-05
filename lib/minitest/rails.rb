# Make double-sure the RAILS_ENV is not set to production,
# so fixtures aren't loaded into that environment
abort("Abort testing: Your Rails environment is running in production mode!") if Rails.env.production?

require "minitest/rails/active_support"
require "minitest/rails/action_controller"
require "minitest/rails/action_mailer"
require "minitest/rails/action_dispatch"

# Enable turn if it is available
begin
  require 'turn'
  require 'turn/unit'
  Turn::Unit.use_natural_language_case_names = true
rescue LoadError
end

if defined?(ActiveRecord::Base)
  class MiniTest::Rails::ActiveSupport::TestCase
    include ActiveRecord::TestFixtures
    self.fixture_path = "#{Rails.root}/test/fixtures/"
  end

  MiniTest::Rails::ActionDispatch::IntegrationTest.fixture_path = MiniTest::Rails::ActiveSupport::TestCase.fixture_path

  def create_fixtures(*table_names, &block)
    Fixtures.create_fixtures(MiniTest::Rails::ActiveSupport::TestCase.fixture_path, table_names, {}, &block)
  end
end

class MiniTest::Rails::ActionController::TestCase
  setup do
    @routes = Rails.application.routes
  end
end

class MiniTest::Rails::ActionDispatch::IntegrationTest
  setup do
    @routes = Rails.application.routes
  end
end
