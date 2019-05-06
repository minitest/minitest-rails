require "helper"

# Can't use describe because there is no spec type to use
class TestActiveSupportExpectations < ActiveSupport::TestCase
  def test_must_change
    counter = 0

    value { counter += 1 }.must_change "counter", from: 0, to: 1

    value { counter += 3 }.must_change "counter", from: 1, to: 4

    value { counter -= 1 }.must_change "counter", from: 4, to: 3
  end

  def test_wont_change
    counter = 0

    value { counter = 0 }.wont_change "counter"
  end

  def test_must_differ
    counter = 0

    value { counter += 1 }.must_differ "counter", +1

    value { counter += 3 }.must_differ "counter", +3

    value { counter -= 1 }.must_differ "counter", -1
  end

  def test_wont_differ
    counter = 0

    value { counter = 0 }.wont_differ "counter"
  end
end
