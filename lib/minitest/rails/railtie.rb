require "rails"

module Minitest
  module Rails
    class Railtie < ::Rails::Railtie # :nodoc:
      generators = config.respond_to?(:app_generators) ? config.app_generators : config.generators
      generators.integration_tool :minitest
      generators.test_framework   :minitest
      generators.fallbacks[:minitest] = :test_unit

      rake_tasks do
        load "minitest/rails/tasks/minitest.rake"
      end
    end
  end
end
