require "active_support/concern"

module Minitest
  module Rails
    module Expectations
      module ActionCable
        module TestHelper
          ##
          # Asserts that the number of broadcasted messages to the stream matches the given number.
          #
          #   def test_broadcasts
          #     must_have_broadcasts 'messages', 0
          #     ActionCable.server.broadcast 'messages', { text: 'hello' }
          #     must_have_broadcasts 'messages', 1
          #     ActionCable.server.broadcast 'messages', { text: 'world' }
          #     must_have_broadcasts 'messages', 2
          #   end
          #
          # If a block is passed, that block should cause the specified number of
          # messages to be broadcasted.
          #
          #   def test_broadcasts_again
          #     must_have_broadcasts('messages', 1) do
          #       ActionCable.server.broadcast 'messages', { text: 'hello' }
          #     end
          #
          #     must_have_broadcasts('messages', 2) do
          #       ActionCable.server.broadcast 'messages', { text: 'hi' }
          #       ActionCable.server.broadcast 'messages', { text: 'how are you?' }
          #     end
          #   end
          #
          # See also ActionCable::TestHelper#assert_broadcasts
          # See https://api.rubyonrails.org/v6.1/classes/ActionCable/TestHelper.html#method-i-assert_broadcasts
          #
          # :method: must_have_broadcasts
          # :call-seq: must_have_broadcasts(stream, number)

          ##
          # Asserts that no messages have been sent to the stream.
          #
          #   def test_no_broadcasts
          #     wont_have_broadcasts 'messages'
          #     ActionCable.server.broadcast 'messages', { text: 'hi' }
          #     must_have_broadcasts 'messages', 1
          #   end
          #
          # If a block is passed, that block should not cause any message to be sent.
          #
          #   def test_broadcasts_again
          #     wont_have_broadcasts 'messages' do
          #       # No job messages should be sent from this block
          #     end
          #   end
          #
          # Note: This assertion is simply a shortcut for:
          #
          #   must_have_broadcasts 'messages', 0, &block
          #
          # See also ActionCable::TestHelper#wont_have_broadcasts
          # See https://api.rubyonrails.org/v6.1/classes/ActionCable/TestHelper.html#method-i-assert_no_broadcasts
          #
          # :method: wont_have_broadcasts
          # :call-seq: wont_have_broadcasts(stream, &block)

          ##
          # Asserts that the specified message has been sent to the stream.
          #
          #   def test_assert_transmitted_message
          #     ActionCable.server.broadcast 'messages', text: 'hello'
          #     must_broadcast_on('messages', text: 'hello')
          #   end
          #
          # If a block is passed, that block should cause a message with the specified data to be sent.
          #
          #   def test_assert_broadcast_on_again
          #     must_broadcast_on('messages', text: 'hello') do
          #       ActionCable.server.broadcast 'messages', text: 'hello'
          #     end
          #   end
          #
          # See also ActionCable::TestHelper#assert_broadcast_on
          # See https://api.rubyonrails.org/v6.1/classes/ActionCable/TestHelper.html#method-i-assert_broadcast_on
          #
          # :method: must_broadcast_on
          # :call-seq: must_broadcast_on(stream, data)

          extend ::ActiveSupport::Concern

          included do
            alias_method :must_have_broadcasts, :assert_broadcasts
            alias_method :wont_have_broadcasts, :assert_no_broadcasts
            alias_method :must_broadcast_on, :assert_broadcast_on
          end
        end

        module Channel
          ##
          # Asserts that no streams have been started.
          #
          #   def test_assert_no_started_stream
          #     subscribe
          #     wont_have_streams
          #   end
          #
          # See also ActionCable::Channel::TestCase#assert_no_streams
          # See https://api.rubyonrails.org/v6.1/classes/ActionCable/Channel/TestCase/Behavior.html#method-i-assert_no_streams
          #
          # :method: wont_have_streams

          ##
          # Asserts that the specified stream has been started.
          #
          #   def test_assert_started_stream
          #     subscribe
          #     must_have_streams 'messages'
          #   end
          #
          # See also ActionCable::Channel::TestCase#assert_has_stream
          # See https://api.rubyonrails.org/v6.1/classes/ActionCable/Channel/TestCase/Behavior.html#method-i-assert_has_stream
          #
          # :method: must_have_streams
          # :call-seq: must_have_streams(stream)

          ##
          # Asserts that the specified stream for a model has started.
          #
          #   def test_assert_started_stream_for
          #     subscribe id: 42
          #     must_have_stream_for User.find(42)
          #   end
          #
          # See also ActionCable::Channel::TestCase#assert_has_stream_for
          # See https://api.rubyonrails.org/v6.1/classes/ActionCable/Channel/TestCase/Behavior.html#method-i-assert_has_stream_for
          #
          # :method: must_have_stream_for
          # :call-seq: must_have_stream_for(object)

          extend ::ActiveSupport::Concern

          included do
            alias_method :wont_have_streams, :assert_no_streams
            alias_method :must_have_streams, :assert_has_stream
            alias_method :must_have_stream_for, :assert_has_stream_for
          end
        end

        module Connection
          ##
          # Asserts that the connection is rejected (via +reject_unauthorized_connection+).
          #
          #   describe "Application Connections", :connection do
          #     it "connects with proper cookie" do
          #       # Simulate the connection request with a cookie.
          #       cookies["user_id"] = users(:john).id
          #
          #       connect
          #
          #       # Assert the connection identifier matches the fixture.
          #       value(connection.user.id).must_equal users(:john).id
          #     end
          #
          #     it "rejects connection without proper cookie" do
          #       must_reject_connection { connect }
          #     end
          #   end
          #
          # See also ActionCable::Connection::TestCase#assert_reject_connection
          # See https://api.rubyonrails.org/v6.1/classes/ActionCable/Connection/Assertions.html#method-i-assert_reject_connection
          #
          # :method: must_reject_connection

          extend ::ActiveSupport::Concern

          included do
            alias_method :must_reject_connection, :assert_reject_connection
          end
        end
      end
    end
  end
end

unless ENV["MT_NO_EXPECTATIONS"]
  class ActionCable::TestCase # :nodoc:
    include Minitest::Rails::Expectations::ActionCable::TestHelper
  end

  class ActionCable::Channel::TestCase # :nodoc:
    include Minitest::Rails::Expectations::ActionCable::TestHelper
    include Minitest::Rails::Expectations::ActionCable::Channel
  end

  class ActionCable::Connection::TestCase # :nodoc:
    include Minitest::Rails::Expectations::ActionCable::Connection
  end
end
