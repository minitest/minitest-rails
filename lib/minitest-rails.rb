require "rails"
require "minitest/unit"

module Minitest
  module Rails
    VERSION = "0.0.7"
    class Railtie < ::Rails::Railtie
      # config.app_generators.integration_tool :minitest
      config.app_generators.test_framework :minitest
      config.app_generators.fallbacks[:minitest] = :test_unit

      rake_tasks do
        load "minitest/rails/tasks/minitest.rake"
      end
    end
  end
end
