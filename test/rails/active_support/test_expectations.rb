require "helper"

# Can't use describe because there is no spec type to use
class TestActiveSupportExpectations < ActiveSupport::TestCase

  def test_must_be_blank
    "".must_be_blank
    nil.must_be_blank
    [].must_be_blank
    Hash.new.must_be_blank
  end

  def test_wont_be_present
    "".wont_be_present
    nil.wont_be_present
    [].wont_be_present
    Hash.new.wont_be_present
  end

  def test_must_be_present
    "here".must_be_present
    Object.new.must_be_present
    [1,2,3].must_be_present
    {:key => :value}.must_be_present
  end

  def test_wont_be_blank
    "here".wont_be_blank
    Object.new.wont_be_blank
    [1,2,3].wont_be_blank
    {:key => :value}.wont_be_blank
  end

  def test_must_change
    counter = 0

    lambda { counter += 1 }.must_change "counter", +1

    lambda { counter += 3 }.must_change "counter", +3

    lambda { counter -= 1 }.must_change "counter", -1
  end

  def test_wont_change
    counter = 0

    lambda { counter = 0 }.wont_change "counter"
  end
end
