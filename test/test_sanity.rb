require "helper"

class TestMinitest < Minitest::Test
  def test_sanity
    assert Minitest::Rails::VERSION
  end
end
