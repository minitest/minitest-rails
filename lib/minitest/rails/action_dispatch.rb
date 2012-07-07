require 'minitest/rails/active_support'
require 'action_dispatch/testing/integration'

module MiniTest
  module Rails
    module ActionDispatch
      class IntegrationTest < MiniTest::Rails::ActiveSupport::TestCase
        include ::ActionDispatch::Integration::Runner
        include ::ActionController::TemplateAssertions

        def app
          super || ::ActionDispatch::IntegrationTest.app
        end
      end
    end
  end
end

# Register by name
MiniTest::Spec.register_spec_type(/AcceptanceTest$/,   MiniTest::Rails::ActionDispatch::IntegrationTest)
MiniTest::Spec.register_spec_type(/Acceptance Test$/,  MiniTest::Rails::ActionDispatch::IntegrationTest)
MiniTest::Spec.register_spec_type(/IntegrationTest$/,  MiniTest::Rails::ActionDispatch::IntegrationTest)
MiniTest::Spec.register_spec_type(/Integration Test$/, MiniTest::Rails::ActionDispatch::IntegrationTest)
