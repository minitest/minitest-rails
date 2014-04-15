require "generators/minitest"

module Minitest
  module Generators
    class GeneratorGenerator < Base
      check_class_collision suffix: "GeneratorTest"

      class_option :namespace, type: :boolean, default: true,
                               desc: "Namespace generator under lib/generators/name"

      def create_generator_files
        if options[:spec]
          template_file = "generator_spec.rb"
        else
          template_file = "generator_test.rb"
        end
        template template_file,
                 File.join("test/lib/generators", class_path, "#{file_name}_generator_test.rb")
      end

      protected

      def generator_path
        if options[:namespace]
          File.join("generators", regular_class_path, file_name, "#{file_name}_generator")
        else
          File.join("generators", regular_class_path, "#{file_name}_generator")
        end
      end
    end
  end
end