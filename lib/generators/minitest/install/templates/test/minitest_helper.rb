require "minitest/autorun"
require "minitest/rails"

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

class MiniTest::Rails::TestCase

  # Add methods to be used by all tests here...

end

class MiniTest::Rails::Spec

  # Add methods to be used by all specs here...

end