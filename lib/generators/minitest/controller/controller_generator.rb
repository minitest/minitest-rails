require "generators/minitest"

module Minitest
  module Generators
    class ControllerGenerator < Base
      argument :actions, type: :array, default: [], banner: "action action"
      check_class_collision suffix: "ControllerTest"

      def create_test_files
        if options[:spec]
          template_file = "controller_spec.rb"
        else
          template_file = "controller_test.rb"
        end
        template template_file,
                 File.join("test/controllers", class_path, "#{file_name}_controller_test.rb")
      end
    end
  end
end
