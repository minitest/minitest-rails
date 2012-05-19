require "minitest/autorun"
require "minitest-rails"

class TestMinitest < Minitest::Unit::TestCase
  def test_sanity
    assert Minitest::Rails::VERSION
  end
end
