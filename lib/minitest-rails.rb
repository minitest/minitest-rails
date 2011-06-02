require "rails/railtie"

require "minitest/unit"
require "minitest/spec"
require "minitest/mock"

require "minitest/rails/all"

module MiniTest
  module Rails
    VERSION = "0.0.1"
    class Railtie < ::Rails::Railtie
      config.app_generators.integration_tool :minitest
      config.app_generators.test_framework   :minitest, :fixture => true
      config.app_generators.fallbacks[:minitest] = :test_unit

      rake_tasks do
        load "minitest/rails/tasks/minitest.rake"
      end
    end
  end
end
