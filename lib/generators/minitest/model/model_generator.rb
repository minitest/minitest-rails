require "generators/minitest"

module Minitest
  module Generators
    class ModelGenerator < Base
      RESERVED_YAML_KEYWORDS = %w(y yes n no true false on off null)

      argument :attributes, type: :array, default: [], banner: "field:type field:type"
      class_option :fixture, type: :boolean, default: true,  desc: "Create fixture file"

      check_class_collision suffix: "Test"

      def create_test_file
        if options[:spec]
          template_file = "model_spec.rb"
        else
          template_file = "model_test.rb"
        end
        template template_file,
                 File.join("test/models", class_path, "#{file_name}_test.rb")
      end

      hook_for :fixture_replacement

      def create_fixture_file
        if options[:fixture] && options[:fixture_replacement].nil?
          template "fixtures.yml", File.join("test/fixtures", class_path, "#{plural_file_name}.yml")
        end
      end

      private

      def yaml_key_value(key, value)
        if RESERVED_YAML_KEYWORDS.include?(key.downcase)
          "'#{key}': #{value}"
        else
          "#{key}: #{value}"
        end
      end
    end
  end
end
