require "generators/mini_test"

module MiniTest
  module Generators
    class IntegrationGenerator < Base
      check_class_collision :suffix => "Test"

      def create_test_files
        if options[:spec]
          template 'integration_spec.rb', File.join('test/integration', class_path, "#{file_name}_test.rb")
        else
          template 'integration_test.rb', File.join('test/integration', class_path, "#{file_name}_test.rb")
        end
      end
    end
  end
end
