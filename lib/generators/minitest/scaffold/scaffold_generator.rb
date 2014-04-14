require "generators/minitest"
require "rails/generators/resource_helpers"

module Minitest
  module Generators
    class ScaffoldGenerator < Base
      include ::Rails::Generators::ResourceHelpers
      argument :actions, type: :array, default: [], banner: "action action"

      check_class_collision suffix: "ControllerTest"

      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_test_files
        if options[:spec]
          template "controller_spec.rb",
                   File.join("test/controllers",
                             class_path,
                             "#{controller_file_name}_controller_test.rb")
        else
          template "controller_test.rb",
                   File.join("test/controllers",
                             class_path,
                             "#{controller_file_name}_controller_test.rb")
        end
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
        end.sort.join(', ')
      end
    end
  end
end
