require "helper"

class NotAChannel
end
class NotAConnection
end

class TestActionCableSpecType < Minitest::Test
  def assert_channel actual
    assert_equal ActionCable::Channel::TestCase, actual
  end

  def refute_channel actual
    refute_equal ActionCable::Channel::TestCase, actual
  end

  def assert_connection actual
    assert_equal ActionCable::Connection::TestCase, actual
  end

  def refute_connection actual
    refute_equal ActionCable::Connection::TestCase, actual
  end

  def test_spec_type_doesnt_resolve_channel_for_class_constants
    refute_channel Minitest::Spec.spec_type(NotAChannel)
    refute_channel Minitest::Spec.spec_type(NotAConnection)
  end

  def test_spec_type_doesnt_resolve_channel_strings
    refute_channel Minitest::Spec.spec_type("Unmatched String")
    refute_channel Minitest::Spec.spec_type("ChannelTest")
    refute_channel Minitest::Spec.spec_type("ApplicationCable::ChannelTest")
  end

  def test_spec_type_resolves_channel_for_class_constant
    assert_channel Minitest::Spec.spec_type(MyAppChannel)
  end

  def test_spec_type_resolves_channel_for_additional_desc_channel
    assert_channel Minitest::Spec.spec_type(NotAChannel, :channel)
    assert_channel Minitest::Spec.spec_type(NotAChannel, :channel, :other)
    assert_channel Minitest::Spec.spec_type(NotAConnection, :other, :channel)
    assert_channel Minitest::Spec.spec_type("Unmatched String", :channel)
    assert_channel Minitest::Spec.spec_type("Unmatched String", :channel, :other)
    assert_channel Minitest::Spec.spec_type("Unmatched String", :other, :channel)
  end

  def test_spec_type_doesnt_resolve_connection_for_class_constants
    refute_connection Minitest::Spec.spec_type(NotAConnection)
    refute_connection Minitest::Spec.spec_type(NotAChannel)
  end

  def test_spec_type_doesnt_resolve_connection_strings
    refute_connection Minitest::Spec.spec_type("Unmatched String")
    refute_connection Minitest::Spec.spec_type("ConnectionTest")
    refute_connection Minitest::Spec.spec_type("ApplicationCable::ConnectionTest")
  end

  def test_spec_type_resolves_connection_for_class_constant
    assert_connection Minitest::Spec.spec_type(MyAppConnection)
  end

  def test_spec_type_resolves_connection_for_additional_desc_connection
    assert_connection Minitest::Spec.spec_type(NotAConnection, :connection)
    assert_connection Minitest::Spec.spec_type(NotAConnection, :connection, :other)
    assert_connection Minitest::Spec.spec_type(NotAChannel, :other, :connection)
    assert_connection Minitest::Spec.spec_type("Unmatched String", :connection)
    assert_connection Minitest::Spec.spec_type("Unmatched String", :connection, :other)
    assert_connection Minitest::Spec.spec_type("Unmatched String", :other, :connection)
  end
end
