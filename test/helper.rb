require "minitest/autorun"
require "tmpdir"

require "rails"
require "rails/generators"

require "sqlite3"
require "active_record"

require "action_controller"
require "action_controller/railtie"

require "action_cable"
require "action_cable/connection/test_case"

begin
  require "active_job"
rescue LoadError
end

require "action_mailer"

module TestApp
  class Application < ::Rails::Application
    config.active_support.test_order = :random
    config.secret_key_base = "abc123"
    config.hosts << "www.example.com"
    config.eager_load = false
    config.load_defaults 7.2
  end
end

TestApp::Application.initialize!

class ApplicationController < ActionController::Base; end

class ModelsController < ApplicationController
  def index
    render html: "<html><head><title>Models</title></head>" \
                 "<body><h1>All <em>Models</em></h1></body></html>".html_safe
  end

  def new
    redirect_to "/models"
  end
end

module Admin
  class WidgetsController < ApplicationController; end
end

TestApp::Application.routes.draw do
  # root to: "models#index"
  resources :models
  namespace :admin do
    resources :widgets
  end
end

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

class UserInviteJob < ActiveJob::Base
  def perform arg = nil; end
end

# Set test adapter and logger
ActionCable.server.config.cable = { "adapter" => "test" }
ActionCable.server.config.logger = Logger.new(nil)

class MyAppChannel < ActionCable::Channel::Base
end

class MyAppConnection < ActionCable::Connection::Base
  def connect
    reject_unauthorized_connection
  end

  def disconnect
    # Any cleanup work needed when the cable connection is cut.
  end
end

require "action_mailer/test_case"

# Emulate AV railtie
require "action_view"
ActionMailer::Base.include(ActionView::Layouts)

# Show backtraces for deprecated behavior for quicker cleanup.
Rails.application.deprecators.debug = true

# Disable available locale checks to avoid warnings running the test suite.
I18n.enforce_available_locales = false

class MyAppMailer < ActionMailer::Base
  def test
    @world = "Earth"
    mail body: render(inline: "Hello, <%= @world %>"),
         to: "test@example.com",
         from: "tester@example.com"
  end

  def test_args recipient, name
    mail body: render(inline: "Hello, #{name}"),
         to: recipient,
         from: "tester@example.com"
  end

  def test_parameter_args
    mail body: render(inline: "All is #{params[:all]}"),
         to: "test@example.com",
         from: "tester@example.com"
  end
end

class MyAppDeliveryJob < ActionMailer::MailDeliveryJob
end

class MyAppDeliveryMailer < MyAppMailer
  self.delivery_job = MyAppDeliveryJob
end

require "minitest-rails"
require "rails/test_help"
require "minitest/rails"

require "minitest/focus"

require "rails/generators/test_case"
class GeneratorTest < Rails::Generators::TestCase
  setup :set_destination
  setup :prepare_destination
  teardown :cleanup_destination

  def set_destination
    self.class.destination Dir.mktmpdir
  end

  def cleanup_destination
    # puts "tree #{self.class.destination_root}"
    # puts `tree #{self.class.destination_root}`
    FileUtils.remove_entry self.class.destination_root
  end
end
