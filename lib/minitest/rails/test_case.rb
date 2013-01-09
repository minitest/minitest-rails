gem "minitest" # make sure we get the gem, not stdlib
require "minitest/spec"

# I hate this! Be sure you have installed minitest_tu_shim
require "test/unit" if RUBY_VERSION < "1.9"

begin
  require "active_support/testing/tagged_logging"
rescue LoadError; end
require "active_support/testing/setup_and_teardown"
require "active_support/testing/assertions"
require "active_support/testing/deprecation"
require "active_support/testing/pending"
require "active_support/testing/isolation"
require "active_support/core_ext/kernel/reporting"

require "minitest/rails/constant_lookup"

begin
  silence_warnings { require "mocha/setup" }
rescue LoadError
end

module MiniTest
  module Rails
    class TestCase < MiniTest::Spec

      # This is deprecated in minitest, but I don't want to change the Rails calls to it.
      # Keep it here for now, until a better way presents itself...
      def assert_block msg = nil
        msg = message(msg) { "Expected block to return true value" }
        assert yield, msg
      end

      if defined?(ActiveRecord::Base)
        # Use AS::TestCase for the base class when describing a model
        register_spec_type(self) do |desc|
          desc < ActiveRecord::Base if desc.is_a?(Class)
        end
      end

      # For backward compatibility with Test::Unit
      def build_message(message, template = nil, *args)
        template = template.gsub('<?>', '<%s>')
        message || sprintf(template, *args)
      end

      Assertion = MiniTest::Assertion
      alias_method :method_name, :name if method_defined? :name
      alias_method :method_name, :__name__ if method_defined? :__name__

      $tags = {}
      def self.for_tag(tag)
        yield if $tags[tag]
      end

      include ::ActiveSupport::Testing::TaggedLogging if defined? ActiveSupport::Testing::TaggedLogging
      include ::ActiveSupport::Testing::SetupAndTeardown
      include ::ActiveSupport::Testing::Assertions
      include ::ActiveSupport::Testing::Deprecation
      include ::ActiveSupport::Testing::Pending

      # Alias `it` instead of extending ActiveSupport::Testing::Declarative
      class << self
        alias :test :it
      end

      # Resolve constants from the test name when using the spec DSL
      include Testing::ConstantLookup

      # test/unit backwards compatibility methods
      alias :assert_raise :assert_raises
      alias :assert_not_empty :refute_empty
      alias :assert_not_equal :refute_equal
      alias :assert_not_in_delta :refute_in_delta
      alias :assert_not_in_epsilon :refute_in_epsilon
      alias :assert_not_includes :refute_includes
      alias :assert_not_instance_of :refute_instance_of
      alias :assert_not_kind_of :refute_kind_of
      alias :assert_no_match :refute_match
      alias :assert_not_nil :refute_nil
      alias :assert_not_operator :refute_operator
      alias :assert_not_predicate :refute_predicate
      alias :assert_not_respond_to :refute_respond_to
      alias :assert_not_same :refute_same

      # Fails if the block raises an exception.
      #
      #   assert_nothing_raised do
      #     ...
      #   end
      def assert_nothing_raised(*args)
        yield
      end
    end
  end
end
