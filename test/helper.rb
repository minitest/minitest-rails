require "minitest/autorun"

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

  def refute_output stdout = nil, stderr = nil
    out, err = capture_io do
      yield
    end

    err_msg = Regexp === stderr ? :refute_match : :refute_equal if stderr
    out_msg = Regexp === stdout ? :refute_match : :refute_equal if stdout

    y = send err_msg, stderr, err, "In stderr" if err_msg
    x = send out_msg, stdout, out, "In stdout" if out_msg

    (!stdout || x) && (!stderr || y)
  end
end

module TestApp
  class Application < ::Rails::Application
    config.active_support.test_order = :random
    config.secret_key_base = "abc123"
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
  # root :to => "models#index"
  resources :models
  namespace :admin do
    resources :widgets
  end
end

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

if defined? ActiveJob
  class UserInviteJob < ActiveJob::Base
    def perform(arg = nil); end
  end
end
