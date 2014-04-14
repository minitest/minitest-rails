require "helper"

class TestActiveSupportAssertions < ActiveSupport::TestCase

  def test_assert_difference
    counter = 0
    assert_difference "counter" do
      counter += 1
    end
    assert_difference "counter", +1 do
      counter += 1
    end
    assert_difference "counter", +3 do
      3.times { counter += 1 }
    end
  end

  def test_refute_difference
    counter = 0
    refute_difference "counter" do
      counter = 0
    end
  end

  def test_assert_no_difference
    counter = 0
    assert_no_difference "counter" do
      counter = 0
    end
  end
end
