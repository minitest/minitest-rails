require "minitest/rails/spec"
require "active_support/test_case"
require "action_controller"
require "action_controller/test_case"

module Minitest
  module Rails
    class Controller < Spec
      include ActiveSupport::Testing::SetupAndTeardown
      include ActionController::TestCase::Behavior

      before do
        @routes = ::Rails.application.routes
      end

      class << self

        # Define a concrete anonymous controller class for testing.
        #
        # The purpose is to test abstract controllers and in particular
        # ApplicationController. For the anonymous controller
        # rendering of templates is disabled. During tests, the routes
        # are redefined to
        #
        #   resources :anonymous
        #
        # base_controller - superclass for the anonymous controller.
        #   If not given, the controller is take from the context.
        #   If that doesn't work either, ApplicationController is used.
        #
        # Examples
        #
        #   describe ApplicationController do
        #     controller
        #
        #     it "assigns the current_user" do
        #       get :index
        #       assigns(:current_user).wont_be_nil
        #     end
        #   end
        #
        #
        def controller(base_controller = nil, &block)
          anonymous = anonymous_controller_class(base_controller)
          anonymous.class_eval(&block) if block_given?
          setup_temporary_anonymous_routes
          self.controller_class = anonymous
        end

        private

        def anonymous_controller_class(base_controller = nil)
          return @anonymous_controller_class if defined?(@anonymous_controller_class)

          base_controller ||= described_controller

          Class.new(base_controller) do
            def index;    end
            def show;     end
            def new;      end
            def create;   end
            def edit;     end
            def update;   end
            def destroy;  end

            def render
              # suppress rendering
            end

            def self.anonymous?
              false
            end

            def self.name
              'anonymous'
            end
          end
        end

        def described_controller
          if @desc.respond_to?(:<) && @desc <= ActionController::Base
            @desc
          else
            ApplicationController
          end
        end

        def setup_temporary_anonymous_routes
          return if defined?(@orig_routes) # We've been here already.

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
end
