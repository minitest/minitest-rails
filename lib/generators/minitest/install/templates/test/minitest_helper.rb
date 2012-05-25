ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/autorun"
require "minitest/rails"

# Uncomment if you want awesome colorful output
# require "minitest/pride"

class Minitest::Rails::Spec
  # Uncomment if you want to support fixtures for all specs
  # or
  # place within spec class you want to support fixtures for
  # include Minitest::Rails::Fixtures

  # For backward compatibility with Test::Unit
  def build_message(message, template = nil, *args)
    template = template.gsub('<?>', '<%s>')
    message || sprintf(template, *args)
  end

  # Add methods to be used by all specs here...

end

class Minitest::Rails::Model

  # Add methods to be used by model specs here...

end

Minitest::Spec.register_spec_type(Minitest::Rails::Model) do |desc|
  desc.respond_to?(:superclass) && desc.superclass == ActiveRecord::Base
end

class Minitest::Rails::Controller

  # Add methods to be used by controller specs here...

end

Minitest::Spec.register_spec_type(/Controller$/, Minitest::Rails::Controller)

class Minitest::Rails::Helper

  # Add methods to be used by helper specs here...

end

Minitest::Spec.register_spec_type(/Helper$/, Minitest::Rails::Helper)

class Minitest::Rails::Mailer

  # Add methods to be used by mailer specs here...

end

Minitest::Spec.register_spec_type(Minitest::Rails::Mailer) do |desc|
  desc.respond_to?(:superclass) && desc.superclass == ActionMailer::Base
end

