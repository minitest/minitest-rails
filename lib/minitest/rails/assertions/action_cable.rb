class ActionCable::TestCase
  ##
  # Asserts that the number of broadcasted messages to the stream matches the given number.
  #
  #   def test_broadcasts
  #     assert_broadcasts 'messages', 0
  #     ActionCable.server.broadcast 'messages', { text: 'hello' }
  #     assert_broadcasts 'messages', 1
  #     ActionCable.server.broadcast 'messages', { text: 'world' }
  #     assert_broadcasts 'messages', 2
  #   end
  #
  # If a block is passed, that block should cause the specified number of
  # messages to be broadcasted.
  #
  #   def test_broadcasts_again
  #     assert_broadcasts('messages', 1) do
  #       ActionCable.server.broadcast 'messages', { text: 'hello' }
  #     end
  #
  #     assert_broadcasts('messages', 2) do
  #       ActionCable.server.broadcast 'messages', { text: 'hi' }
  #       ActionCable.server.broadcast 'messages', { text: 'how are you?' }
  #     end
  #   end
  #
  # See also Minitest::Rails::Expectations::ActionCable::TestHelper#must_have_broadcasts
  # See https://api.rubyonrails.org/v6.1/classes/ActionCable/TestHelper.html#method-i-assert_broadcasts
  #
  # :method: assert_broadcasts
  # :call-seq: assert_broadcasts(stream, number)

  ##
  # Asserts that no messages have been sent to the stream.
  #
  #   def test_no_broadcasts
  #     refute_broadcasts 'messages'
  #     ActionCable.server.broadcast 'messages', { text: 'hi' }
  #     assert_broadcasts 'messages', 1
  #   end
  #
  # If a block is passed, that block should not cause any message to be sent.
  #
  #   def test_broadcasts_again
  #     refute_broadcasts 'messages' do
  #       # No job messages should be sent from this block
  #     end
  #   end
  #
  # Note: This assertion is simply a shortcut for:
  #
  #   assert_broadcasts 'messages', 0, &block
  #
  # See also Minitest::Rails::Expectations::ActionCable::TestHelper#wont_have_broadcasts
  # See https://api.rubyonrails.org/v6.1/classes/ActionCable/TestHelper.html#method-i-assert_no_broadcasts
  #
  # :method: refute_broadcasts
  # :call-seq: refute_broadcasts(stream, &block)
  alias refute_broadcasts assert_no_broadcasts

  ##
  # Asserts that the specified message has been sent to the stream.
  #
  #   def test_assert_transmitted_message
  #     ActionCable.server.broadcast 'messages', text: 'hello'
  #     assert_broadcast_on('messages', text: 'hello')
  #   end
  #
  # If a block is passed, that block should cause a message with the specified data to be sent.
  #
  #   def test_assert_broadcast_on_again
  #     assert_broadcast_on('messages', text: 'hello') do
  #       ActionCable.server.broadcast 'messages', text: 'hello'
  #     end
  #   end
  #
  # See also Minitest::Rails::Expectations::ActionCable::TestHelper#must_broadcast_on
  # See https://api.rubyonrails.org/v6.1/classes/ActionCable/TestHelper.html#method-i-assert_broadcast_on
  #
  # :method: assert_broadcast_on
  # :call-seq: assert_broadcast_on(stream, data)
end

class ActionCable::Channel::TestCase
  ##
  # Asserts that the number of broadcasted messages to the stream matches the given number.
  #
  #   def test_broadcasts
  #     assert_broadcasts 'messages', 0
  #     ActionCable.server.broadcast 'messages', { text: 'hello' }
  #     assert_broadcasts 'messages', 1
  #     ActionCable.server.broadcast 'messages', { text: 'world' }
  #     assert_broadcasts 'messages', 2
  #   end
  #
  # If a block is passed, that block should cause the specified number of
  # messages to be broadcasted.
  #
  #   def test_broadcasts_again
  #     assert_broadcasts('messages', 1) do
  #       ActionCable.server.broadcast 'messages', { text: 'hello' }
  #     end
  #
  #     assert_broadcasts('messages', 2) do
  #       ActionCable.server.broadcast 'messages', { text: 'hi' }
  #       ActionCable.server.broadcast 'messages', { text: 'how are you?' }
  #     end
  #   end
  #
  # See also Minitest::Rails::Expectations::ActionCable::TestHelper#must_have_broadcasts
  # See https://api.rubyonrails.org/v6.1/classes/ActionCable/TestHelper.html#method-i-assert_broadcasts
  #
  # :method: assert_broadcasts
  # :call-seq: assert_broadcasts(stream, number)

  ##
  # Asserts that no messages have been sent to the stream.
  #
  #   def test_no_broadcasts
  #     refute_broadcasts 'messages'
  #     ActionCable.server.broadcast 'messages', { text: 'hi' }
  #     assert_broadcasts 'messages', 1
  #   end
  #
  # If a block is passed, that block should not cause any message to be sent.
  #
  #   def test_broadcasts_again
  #     refute_broadcasts 'messages' do
  #       # No job messages should be sent from this block
  #     end
  #   end
  #
  # Note: This assertion is simply a shortcut for:
  #
  #   assert_broadcasts 'messages', 0, &block
  #
  # See also Minitest::Rails::Expectations::ActionCable::TestHelper#wont_have_broadcasts
  # See https://api.rubyonrails.org/v6.1/classes/ActionCable/TestHelper.html#method-i-assert_no_broadcasts
  #
  # :method: refute_broadcasts
  # :call-seq: refute_broadcasts(stream, &block)
  alias refute_broadcasts assert_no_broadcasts

  ##
  # Asserts that the specified message has been sent to the stream.
  #
  #   def test_assert_transmitted_message
  #     ActionCable.server.broadcast 'messages', text: 'hello'
  #     assert_broadcast_on('messages', text: 'hello')
  #   end
  #
  # If a block is passed, that block should cause a message with the specified data to be sent.
  #
  #   def test_assert_broadcast_on_again
  #     assert_broadcast_on('messages', text: 'hello') do
  #       ActionCable.server.broadcast 'messages', text: 'hello'
  #     end
  #   end
  #
  # See also Minitest::Rails::Expectations::ActionCable::TestHelper#must_broadcast_on
  # See https://api.rubyonrails.org/v6.1/classes/ActionCable/TestHelper.html#method-i-assert_broadcast_on
  #
  # :method: assert_broadcast_on
  # :call-seq: assert_broadcast_on(stream, data)

  ##
  # Asserts that no streams have been started.
  #
  #   def test_assert_no_started_stream
  #     subscribe
  #     assert_no_streams
  #   end
  #
  # See also Minitest::Rails::Expectations::ActionCable::Channel#wont_have_streams
  # See https://api.rubyonrails.org/v6.1/classes/ActionCable/Channel/TestCase/Behavior.html#method-i-assert_no_streams
  #
  # :method: refute_streams
  alias refute_streams assert_no_streams

  ##
  # Asserts that the specified stream has been started.
  #
  #   def test_assert_started_stream
  #     subscribe
  #     assert_has_stream 'messages'
  #   end
  #
  # See also Minitest::Rails::Expectations::ActionCable::Channel#must_have_streams
  # See https://api.rubyonrails.org/v6.1/classes/ActionCable/Channel/TestCase/Behavior.html#method-i-assert_has_stream
  #
  # :method: assert_has_stream
  # :call-seq: assert_has_stream(stream)

  ##
  # Asserts that the specified stream for a model has started.
  #
  #   def test_assert_started_stream_for
  #     subscribe id: 42
  #     assert_has_stream_for User.find(42)
  #   end
  #
  # See also Minitest::Rails::Expectations::ActionCable::Channel#must_have_stream_for
  # See https://api.rubyonrails.org/v6.1/classes/ActionCable/Channel/TestCase/Behavior.html#method-i-assert_has_stream_for
  #
  # :method: assert_has_stream_for
  # :call-seq: assert_has_stream_for(object)
end

class ActionCable::Connection::TestCase
  # Asserts that the connection is rejected (via +reject_unauthorized_connection+).
  #
  #   class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  #     def test_connects_with_proper_cookie
  #       # Simulate the connection request with a cookie.
  #       cookies["user_id"] = users(:john).id
  #
  #       connect
  #
  #       # Assert the connection identifier matches the fixture.
  #       assert_equal users(:john).id, connection.user.id
  #     end
  #
  #     def test_rejects_connection_without_proper_cookie
  #       assert_reject_connection { connect }
  #     end
  #   end
  #
  # See also Minitest::Rails::Expectations::ActionCable#must_reject_connection
  # See https://api.rubyonrails.org/v6.1/classes/ActionCable/Connection/Assertions.html#method-i-assert_reject_connection
  #
  # :method: assert_reject_connection
end
