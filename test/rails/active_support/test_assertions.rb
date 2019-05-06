require "helper"

class TestActiveSupportAssertions < ActiveSupport::TestCase
  def test_assert_changes
    counter = 0
    assert_changes "counter", from: 0, to: 1 do
      counter += 1
    end
    assert_changes "counter", from: 1, to: 2 do
      counter += 1
    end
    assert_changes "counter", from: 2, to: 5 do
      3.times { counter += 1 }
    end
  end

  def test_refute_changes
    counter = 0
    refute_changes "counter" do
      counter = 0
    end
  end

  def test_assert_no_changes
    counter = 0
    assert_no_changes "counter" do
      counter = 0
    end
  end

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
