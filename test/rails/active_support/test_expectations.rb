require "helper"

# Can't use describe because there is no spec type to use
class TestActiveSupportExpectations < ActiveSupport::TestCase

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
