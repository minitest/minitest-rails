require "generators/minitest"
require "rails/generators/resource_helpers"

module Minitest
  module Generators
    class ScaffoldGenerator < Base
      include ::Rails::Generators::ResourceHelpers

      check_class_collision suffix: "ControllerTest"

      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_test_files
        if options[:spec]
          template_file = "controller_spec.rb"
        else
          template_file = "controller_test.rb"
        end
        template template_file,
                 File.join("test/controllers", controller_class_path, "#{controller_file_name}_controller_test.rb")
      end

      private

      def attributes_hash
        return if attributes_names.empty?

        attributes_names.map do |name|
          if %w(password password_confirmation).include?(name) && attributes.any?(&:password_digest?)
            "#{name}: 'secret'"
          else
            "#{name}: @#{singular_table_name}.#{name}"
          end
        end.sort.join(", ")
      end
    end
  end
end
