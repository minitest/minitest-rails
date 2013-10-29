require "minitest/rails"
require "rails/generators/test_case"

class Rails::Generators::TestCase
  register_spec_type(self) do |desc|
    Class === desc && desc < Rails::Generators::Base
  end

  register_spec_type(/Generator( ?Test)?\z/i, self)

  def self.determine_default_generator(name)
    generator = determine_constant_from_test_name(name) do |constant|
      Class === constant && constant < Rails::Generators::Base
    end
    raise NameError.new("Unable to resolve generator for #{name}") if generator.nil?
    generator
  end
end
