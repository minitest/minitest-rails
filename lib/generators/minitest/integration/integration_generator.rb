require "generators/minitest"

module Minitest
  module Generators
    class IntegrationGenerator < Base
      check_class_collision suffix: "Test"

      def create_test_files
        if options[:spec]
          template_file = "integration_spec.rb"
        else
          template_file = "integration_test.rb"
        end
        template template_file,
                 File.join("test/integration", class_path, "#{file_name}_test.rb")
      end
    end
  end
end
