if defined?(Rake.application) && Rake.application.top_level_tasks.grep(/^test(?::|$)/).any?
  ENV['RAILS_ENV'] ||= 'test'
end

require "rails"

module Minitest
  module Rails
    class Railtie < ::Rails::Railtie
      config.app_generators do |c|
        c.test_framework :minitest,
                         fixture: true,
                         fixture_replacement: nil
        c.integration_tool :minitest
        c.fallbacks[:minitest] = :test_unit
      end

      rake_tasks do
        load "rails/test_unit/testing.rake"
      end
    end
  end
end
