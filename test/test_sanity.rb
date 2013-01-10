require "helper"

class TestMiniTest < MiniTest::Unit::TestCase
  def test_sanity
    assert MiniTest::Rails::VERSION
  end
end
