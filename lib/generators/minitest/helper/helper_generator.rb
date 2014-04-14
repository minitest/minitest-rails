require "generators/minitest"

module Minitest
  module Generators
    class HelperGenerator < Base
      check_class_collision suffix: "HelperTest"

      def create_helper_files
        if options[:spec]
          template_file = "helper_spec.rb"
        else
          template_file = "helper_test.rb"
        end
        template template_file,
                 File.join("test/helpers", class_path, "#{file_name}_helper_test.rb")
      end
    end
  end
end
