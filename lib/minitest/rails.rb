gem "minitest"
require "minitest"
require "minitest/spec"
require "minitest/mock"
require "minitest/hell" if ENV["MT_HELL"]

require "active_support/test_case"
require "active_support/testing/constant_lookup"

class ActiveSupport::TestCase
  # Add and configure the spec DSL
  # Remove describe method if present
  if respond_to?(:describe) &&
     method(:describe).owner == ActiveSupport::TestCase
    class << self
      remove_method :describe
    end
  end

  # Add spec DSL
  extend Minitest::Spec::DSL

  # Resolve constants from the test name when using the spec DSL
  include ActiveSupport::Testing::ConstantLookup

  # Use AS::TC for the base class when describing a model
  if defined? ActiveRecord
    register_spec_type(self) do |desc|
      desc < ActiveRecord::Base if desc.is_a?(Class)
    end
  end

  # Use AS::TC for the base class when described using :model
  register_spec_type(self) do |_desc, *addl|
    addl.include? :model
  end
end

require "action_view/test_case"

class ActionView::TestCase
  # Use AV::TC for the base class when described using :view or :helper
  register_spec_type(self) do |_desc, *addl|
    addl.include?(:view) || addl.include?(:helper)
  end

  # Resolve the helper or view from the test name when using the spec DSL
  def self.determine_default_helper_class name
    determine_constant_from_test_name(name) do |constant|
      Module === constant && !(Class === constant)
    end
  end
end

if defined? ActiveJob
  # TODO: require?

  class ActiveJob::TestCase
    # Use AJ::TC for the base when describing a job
    register_spec_type(self) do |desc|
      desc < ActiveJob::Base if desc.is_a?(Class)
    end

    # Use AJ::TC for the base class when described using :job
    register_spec_type(self) do |_desc, *addl|
      addl.include? :job
    end
  end
end

if defined? ActionMailer
  require "action_mailer/test_helper"
  require "action_mailer/test_case"

  class ActionMailer::TestCase
    # Use AM::TC for the base class when describing a mailer
    register_spec_type(self) do |desc|
      desc < ActionMailer::Base if desc.is_a?(Class)
    end

    # Use AM::TC for the base class when described using :mailer
    register_spec_type(self) do |_desc, *addl|
      addl.include? :mailer
    end

    # Resolve the mailer from the test name when using the spec DSL
    def self.determine_default_mailer name
      mailer = determine_constant_from_test_name(name) do |constant|
        Class === constant && constant < ::ActionMailer::Base
      end
      raise ActionMailer::NonInferrableMailerError, name if mailer.nil?

      mailer
    end
  end
end

require "action_dispatch/testing/integration"

class ActionDispatch::IntegrationTest
  # Use AD:IT for the base class when describing a controller
  register_spec_type(self) do |desc|
    desc < ActionController::Metal if desc.is_a?(Class)
  end

  # Use AD:IT for the base class when described using :integration
  register_spec_type(self) do |_desc, *addl|
    addl.include? :integration
  end
end

# TODO: Rails::Generators::TestCase require?

class Rails::Generators::TestCase
  # Use R::G::TC for the base class when describing a generator
  register_spec_type(self) do |desc|
    desc < Rails::Generators::Base if desc.is_a?(Class)
  end

  # Use R::G::TC for the base class when described using :generator
  register_spec_type(self) do |_desc, *addl|
    addl.include? :generator
  end

  # Resolve the generator from the test name when using the spec DSL
  def self.determine_default_generator name
    generator = determine_constant_from_test_name(name) do |constant|
      Class === constant && constant < Rails::Generators::Base
    end
    raise NameError, "Unable to resolve generator for #{name}" if generator.nil?

    generator
  end
end

if defined? ActionCable
  # TODO: require?

  class ActionCable::Channel::TestCase
    # Use AC::Ch::TC for the base class when describing a channel
    register_spec_type(self) do |desc|
      desc < ActionCable::Channel::Base if desc.is_a?(Class)
    end

    # Use AC::Ch::TC for the base class when described using :channel
    register_spec_type(self) do |_desc, *addl|
      addl.include? :channel
    end

    # # Resolve the channel from the test name when using the spec DSL
    # def self.determine_default_channel name
    #   channel = determine_constant_from_test_name(name) do |constant|
    #      Class === constant && constant < ActionCable::Channel::Base
    #    end
    #    raise NonInferrableChannelError.new(name) if channel.nil?
    #    channel
    # end
  end

  class ActionCable::Connection::TestCase
    # Use AC::Co::TC for the base class when describing a connection
    register_spec_type(self) do |desc|
      desc < ActionCable::Connection::Base if desc.is_a?(Class)
    end

    # Use AC::Co::TC for the base class when described using :connection
    register_spec_type(self) do |_desc, *addl|
      addl.include? :connection
    end

    # def self.determine_default_connection(name)
    #   connection = determine_constant_from_test_name(name) do |constant|
    #     Class === constant && constant < ActionCable::Connection::Base
    #   end
    #   raise NonInferrableConnectionError.new(name) if connection.nil?
    #   connection
    # end
  end
end

################################################################################
# Assertions and Expectations
################################################################################

require "minitest/rails/assertions"
require "minitest/rails/expectations"

# :stopdoc:

################################################################################
# Run load hooks so that other gems can register spec types
################################################################################

ActiveSupport.run_load_hooks(:minitest, ActiveSupport::TestCase)
