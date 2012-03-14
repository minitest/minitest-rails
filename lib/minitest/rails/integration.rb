require "minitest/rails/spec"
require "action_dispatch/testing/integration"

module MiniTest
  module Rails
    class Integration < Spec
      include ActiveSupport::Testing::SetupAndTeardown
      include ActionDispatch::Integration::RequestHelpers
      include ActionDispatch::Integration::Runner

      before do
        @app = ::Rails.application
      end
    end
  end
end

MiniTest::Spec.register_spec_type /Integration Test$/, MiniTest::Rails::Integration

