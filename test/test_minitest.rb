require "minitest/autorun"
require "minitest-rails"

class TestMiniTest < MiniTest::Unit::TestCase
  def test_sanity
    flunk "It burns!"
  end
end
