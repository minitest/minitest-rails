require "minitest/autorun"
require "minitest/rails"

# Uncomment if you want awesome colorful output
# require "minitest/pride"

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

class MiniTest::Rails::Spec
  # Uncomment if you want to support fixtures for all specs
  # or
  # place within spec class you want to support fixtures for
  # include MiniTest::Rails::Fixtures

  # Add methods to be used by all specs here
end

class MiniTest::Rails::Model
  # Add methods to be used by model specs here
end

class MiniTest::Rails::Controller
  # Add methods to be used by controller specs here
end

class MiniTest::Rails::Helper
  # Add methods to be used by helper specs here
end

class MiniTest::Rails::Mailer
  # Add methods to be used by mailer specs here
end

class MiniTest::Rails::Integration
  # Add methods to be used by integration specs here
end
