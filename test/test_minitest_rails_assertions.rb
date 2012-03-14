require "minitest/autorun"
require "minitest/rails/assertions"

class TestMiniTest < MiniTest::Unit::TestCase
  def test_sanity
    assert MiniTest::Rails::Assertions
  end
end
