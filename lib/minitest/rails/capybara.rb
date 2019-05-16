require "minitest/rails"
require "capybara/minitest"
require "capybara/minitest/spec"

class ActionDispatch::SystemTestCase
  # Enable Capybara's spec DSL
  class << self
    alias background before
    alias scenario   it
    alias given      let
  end
end

module Kernel # :nodoc:
  # Enable Capybara's spec DSL
  alias feature describe
end
