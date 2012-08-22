require "generators/mini_test"

module MiniTest
  module Generators
    class IntegrationGenerator < Base
      class_option :spec, :type => :boolean, :default => false, :desc => "Use MiniTest::Spec DSL"

      check_class_collision :suffix => "Test"

      def create_test_files
        format = options.spec? ? "spec" : "test"
        template "integration_#{format}.rb", File.join(
          format, "acceptance", class_path, "#{file_name}_#{format}.rb"
        )
      end

    end
  end
end
