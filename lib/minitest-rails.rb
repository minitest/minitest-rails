require "rails"
require "minitest/unit"

module MiniTest
  module Rails
    VERSION = "0.1.0.alpha2"
    class Railtie < ::Rails::Railtie
      if ::Rails.version.to_f >= 3.1
        config.app_generators.integration_tool :mini_test
        config.app_generators.test_framework   :mini_test
        config.app_generators.fallbacks[:mini_test] = :test_unit
      else
        config.generators.integration_tool :mini_test
        config.generators.test_framework   :mini_test
        config.generators.fallbacks[:mini_test] = :test_unit
      end

      rake_tasks do
        load "minitest/rails/tasks/minitest.rake"
      end
    end
  end
end
