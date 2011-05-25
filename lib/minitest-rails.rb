require 'active_support/testing/setup_and_teardown'
require 'active_record/fixtures'
require 'action_controller/test_case'
require 'minitest/unit'
require 'minitest/spec'
require 'minitest/mock'

module MiniTest
  module Rails
    VERSION = '0.0.1'
    class Railtie < ::Rails::Railtie
      config.app_generators.integration_tool :minitest
      config.app_generators.test_framework   :minitest

      rake_tasks do
        load 'minitest/rails/tasks/minitest.rake'
      end
    end
  end
end

# Tip of hat to tenderlove for the following
# https://gist.github.com/821572
class MiniTest::Unit::TestCase
  include ActiveSupport::Testing::SetupAndTeardown

  def testing_model
    include ActiveRecord::TestFixtures
    self.fixture_path = File.join(Rails.root, 'test', 'fixtures')
  end

  def testing_controller
    include ActionController::TestCase::Behavior
  end

  # Support integration tests by calling ""
end

class MiniTest::Spec
  alias :method_name :__name__ if defined? :__name__
end
