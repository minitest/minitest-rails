require "minitest/autorun"

require "rails"
require "rails/generators"

require "sqlite3"
require "active_record"

require "action_controller"
require "action_controller/railtie"

require "action_mailer"

require "minitest-rails"
require "rails/test_help"
require "minitest/rails"

require "fakefs/safe"

class FakeFS::File
  def self.binread file
    File.open(file, "rb") { |f| f.read }
  end
end

class GeneratorTest < Minitest::Test
  def setup
    Rails::Generators.no_color!
    FakeFS.activate!
    FakeFS::FileSystem.clone "lib/generators"
  end

  def teardown
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end
end

require "rails/test_help"

module TestApp
  class Application < ::Rails::Application
    config.secret_key_base = "abc123"
  end
end

TestApp::Application.initialize!

class ApplicationController < ActionController::Base; end
class ModelsController < ApplicationController
  def index; render :text => "<html><head><title>Models</title></head><body><h1>All Models</h1></body></html>"; end
  def new; redirect_to "/models"; end
end
module Admin
  class WidgetsController < ApplicationController; end
end

TestApp::Application.routes.draw do
  # root :to => "models#index"
  resources :models
  namespace :admin do
    resources :widgets
  end
end

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
