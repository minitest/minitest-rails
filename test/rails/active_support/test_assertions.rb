require "helper"

class TestActiveSupportAssertions < ActiveSupport::TestCase

  def test_assert_blank
    assert_blank ""
    assert_blank nil
    assert_blank []
    assert_blank Hash.new
  end

  def test_refute_present
    refute_present ""
    refute_present nil
    refute_present []
    refute_present Hash.new
  end

  def test_assert_present
    assert_present "here"
    assert_present Object.new
    assert_present [1,2,3]
    assert_present :key => :value
  end

  def test_refute_blank
    refute_blank "here"
    refute_blank Object.new
    refute_blank [1,2,3]
    refute_blank :key => :value
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
