# frozen_string_literal: true

require "generators/minitest"

module Minitest # :nodoc:
  module Generators # :nodoc:
    class GeneratorGenerator < Base # :nodoc:
      check_class_collision suffix: "GeneratorTest"

      class_option :namespace, type: :boolean, default: true,
                               desc: "Namespace generator under lib/generators/name"

      def create_generator_files
        template "generator_#{test_file_type}.rb", File.join("test/lib/generators", class_path, "#{file_name}_generator_test.rb")
      end

      private

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
