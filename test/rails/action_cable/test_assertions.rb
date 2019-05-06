require "helper"

class TestActionCableAssertions < ActionCable::TestCase
  def test_assert_broadcasts
    assert_broadcasts("test", 1) do
      ActionCable.server.broadcast "test", "message"
    end
  end

  def test_assert_no_broadcasts
    assert_no_broadcasts("test") do
      ActionCable.server.broadcast "test2", "message"
    end
  end

  def test_refute_broadcasts
    refute_broadcasts("test") do
      ActionCable.server.broadcast "test2", "message"
    end
  end

  def test_assert_broadcast_on
    assert_broadcast_on("test", "message") do
      ActionCable.server.broadcast "test", "message"
    end
  end
end

class TestActionCableChannelAssertions < ActionCable::Channel::TestCase
  tests MyAppChannel

  def test_assert_broadcasts
    assert_broadcasts("test", 1) do
      ActionCable.server.broadcast "test", "message"
    end
  end

  def test_assert_no_broadcasts
    assert_no_broadcasts("test") do
      ActionCable.server.broadcast "test2", "message"
    end
  end

  def test_refute_broadcasts
    refute_broadcasts("test") do
      ActionCable.server.broadcast "test2", "message"
    end
  end

  def test_assert_broadcast_on
    assert_broadcast_on("test", "message") do
      ActionCable.server.broadcast "test", "message"
    end
  end

  def test_has_expected_assertions
    assert respond_to? :assert_has_stream
    assert respond_to? :assert_no_streams
    assert respond_to? :refute_streams
    assert respond_to? :assert_has_stream_for
  end
end

class TestActionCableConnectionAssertions < ActionCable::Connection::TestCase
  tests MyAppConnection

  def test_rejects_connection_without_proper_cookie
    assert_reject_connection { connect }
  end
end
