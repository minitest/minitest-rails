require "helper"

class TestActionCableExpectations < ActionCable::TestCase
  def test_must_have_broadcasts
    must_have_broadcasts("test", 1) do
      ActionCable.server.broadcast "test", "message"
    end
  end

  def test_wont_have_broadcasts
    wont_have_broadcasts("test") do
      ActionCable.server.broadcast "test2", "message"
    end
  end

  def test_must_broadcast_on
    must_broadcast_on("test", "message") do
      ActionCable.server.broadcast "test", "message"
    end
  end
end

class TestActionCableChannelExpectations < ActionCable::Channel::TestCase
  tests MyAppChannel

  def test_must_have_broadcasts
    must_have_broadcasts("test", 1) do
      ActionCable.server.broadcast "test", "message"
    end
  end

  def test_wont_have_broadcasts
    wont_have_broadcasts("test") do
      ActionCable.server.broadcast "test2", "message"
    end
  end

  def test_must_broadcast_on
    must_broadcast_on("test", "message") do
      ActionCable.server.broadcast "test", "message"
    end
  end

  def test_has_expected_expectations
    assert respond_to? :wont_have_streams
    assert respond_to? :must_have_streams
    assert respond_to? :must_have_stream_for
  end
end

class TestActionCableConnectionExpectations < ActionCable::Connection::TestCase
  tests MyAppConnection

  def test_rejects_connection_without_proper_cookie
    must_reject_connection { connect }
  end
end
