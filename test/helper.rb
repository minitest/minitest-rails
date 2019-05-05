require "minitest/autorun"
require "tmpdir"

require "rails"
require "rails/generators"

require "sqlite3"
require "active_record"

require "action_controller"
require "action_controller/railtie"

begin
  require "active_job"
rescue LoadError
end

require "action_mailer"

require "minitest-rails"
require "rails/test_help"
require "minitest/rails"

require "minitest/focus"

require "rails/generators/test_case"
class GeneratorTest < ::Rails::Generators::TestCase
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

module TestApp
  class Application < ::Rails::Application
    config.active_support.test_order = :random
    config.secret_key_base = "abc123"
    config.hosts << "www.example.com"
  end
end

TestApp::Application.initialize!

class ApplicationController < ActionController::Base; end
class ModelsController < ApplicationController
  def index; render html: "<html><head><title>Models</title></head><body><h1>All <em>Models</em></h1></body></html>".html_safe; end
  def new; redirect_to "/models"; end
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
  def perform(arg = nil); end
end
