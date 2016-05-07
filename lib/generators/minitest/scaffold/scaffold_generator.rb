require "generators/minitest"
require "rails/generators/resource_helpers"

module Minitest
  module Generators
    class ScaffoldGenerator < Base
      include ::Rails::Generators::ResourceHelpers

      check_class_collision suffix: "ControllerTest"

      class_option :api, type: :boolean,
                         desc: "Generates API functional tests"

      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_test_files
        if options.api?
          if options[:spec]
            template_file = "api_controller_spec.rb"
          else
            template_file = "api_controller_test.rb"
          end
        else
          if options[:spec]
            template_file = "controller_spec.rb"
          else
            template_file = "controller_test.rb"
          end
        end
        template template_file,
                 File.join("test/controllers", controller_class_path, "#{controller_file_name}_controller_test.rb")
      end

      def fixture_name
        @fixture_name ||=
          if mountable_engine?
            "%s_%s" % [namespaced_path, table_name]
          else
            table_name
          end
      end

      private

      def attributes_hash
        return if attributes_names.empty?

        attributes_names.map do |name|
          if %w(password password_confirmation).include?(name) && attributes.any?(&:password_digest?)
            "#{name}: 'secret'"
          else
            # don't use the ivar, use the accessor method
            "#{name}: #{singular_table_name}.#{name}"
          end
        end.sort.join(", ")
      end
    end
  end
end
