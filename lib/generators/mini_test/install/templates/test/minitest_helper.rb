require "minitest/autorun"
require "minitest/rails"

# Uncomment if you want awesome colorful output
# require "minitest/pride"

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

class MiniTest::Rails::Spec
  # Uncomment if you want to support fixtures for all specs
  # or
  # place within spec class you want to support fixtures for
  # include MiniTest::Rails::Fixtures

  # For backward compatibility with Test::Unit
  def build_message(message, template = nil, *args)
    template = template.gsub('<?>', '<%s>')
    message || sprintf(template, *args)
  end

  # Add methods to be used by all specs here...

end

class MiniTest::Rails::Model

  # Add methods to be used by model specs here...

end

MiniTest::Spec.register_spec_type(MiniTest::Rails::Model) do |desc|
  desc.respond_to?(:superclass) && desc.superclass == ActiveRecord::Base
end

class MiniTest::Rails::Controller

  # Add methods to be used by controller specs here...

end

MiniTest::Spec.register_spec_type(/Controller$/, MiniTest::Rails::Controller)

class MiniTest::Rails::Helper

  # Add methods to be used by helper specs here...

end

MiniTest::Spec.register_spec_type(/Helper$/, MiniTest::Rails::Helper)

class MiniTest::Rails::Mailer

  # Add methods to be used by mailer specs here...

end

MiniTest::Spec.register_spec_type(MiniTest::Rails::Mailer) do |desc|
  desc.respond_to?(:superclass) && desc.superclass == ActionMailer::Base
end

