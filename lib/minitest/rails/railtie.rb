require "rails"

module MiniTest
  module Rails
    class Railtie < ::Rails::Railtie
      generators = config.respond_to?(:app_generators) ? config.app_generators : config.generators
      generators.integration_tool :mini_test
      generators.test_framework   :mini_test
      generators.fallbacks[:mini_test] = :test_unit

      rake_tasks do
        load "minitest/rails/tasks/minitest.rake"
      end
    end
  end
end
