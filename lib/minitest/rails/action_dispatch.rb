require 'minitest/rails/active_support'
require 'action_dispatch/testing/integration'
require 'action_controller/test_case'
require 'action_dispatch/routing/url_for'

module MiniTest
  module Rails
    module ActionDispatch
      class IntegrationTest < MiniTest::Rails::ActiveSupport::TestCase
        include ::ActionDispatch::Integration::Runner
        include ::ActionController::TemplateAssertions
        include ::ActionDispatch::Routing::UrlFor

        @@app = nil

        def self.app
          # DEPRECATE Rails application fallback
          # This should be set by the initializer
          @@app || (defined?(::Rails.application) && ::Rails.application) || nil
        end

        def self.app=(app)
          @@app = app
        end

        def app
          super || ::ActionDispatch::IntegrationTest.app
        end
        
        def url_options
          reset! unless integration_session
          integration_session.url_options
        end

        # Register by name
        register_spec_type(/(Acceptance|Integration)( ?Test)?\z/i, self)
      end
    end
  end
end
