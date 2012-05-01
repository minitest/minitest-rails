require "minitest/rails/spec"
require "active_support/test_case"
require "action_controller"
require "action_controller/test_case"

module MiniTest
  module Rails
    class Controller < Spec
      include ActiveSupport::Testing::SetupAndTeardown
      include ActionController::TestCase::Behavior

      before do
        @routes = ::Rails.application.routes
      end

      # Define an anonymous controller class for testing.
      #
      # The purpose is to test abstract controllers and in particular
      # ApplicationController. For the anonymous controller
      # rendering of templates is disabled. During tests, the routes
      # are redefined to
      #
      #  resources :anonymous
      #
      # base_controller - superclass for the anonymous controller.
      #
      # Examples
      #
      #  describe ApplicationController do
      #    controller do
      #      def index; end
      #    end
      #
      #    it "assigns the current_user" do
      #      get :index
      #      assigns(:current_user).wont_be_nil
      #    end
      #  end
      #
      #
      def self.controller(base_controller = ApplicationController, &block)
        anonymous_controller_class = Class.new(base_controller) do
          def render
            # suppress rendering
          end

          def self.anonymous?
            # Oh, the irony.
            false
          end

          def self.name
            # As of Rails 3.2.3, the name generated for anonymous controller
            # classes is incorrect.
            # See https://github.com/rails/rails/pull/6053
            # This method, in conjunction with the overridden #anonymous?
            # works around that issue.
            'anonymous'
          end
        end

        anonymous_controller_class.class_eval(&block)

        self.controller_class = anonymous_controller_class

        before do
          @orig_routes, @routes = @routes, ActionDispatch::Routing::RouteSet.new
          @routes.draw { resources :anonymous }
        end

        after do
          @routes, @orig_routes = @orig_routes, nil
        end
      end

    end
  end
end
