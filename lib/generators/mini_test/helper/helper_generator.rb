require "generators/mini_test"

module MiniTest
  module Generators
    class HelperGenerator < Base
      check_class_collision :suffix => "HelperTest"

      def create_test_files
        if options[:spec]
          template "helper_spec.rb", File.join("test/helpers", class_path, "#{file_name}_helper_test.rb")
        else
          template "helper_test.rb", File.join("test/helpers", class_path, "#{file_name}_helper_test.rb")
        end
      end
    end
  end
end
