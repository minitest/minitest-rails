require "generators/mini_test"
require "rails/generators/resource_helpers"

module MiniTest
  module Generators
    class ScaffoldGenerator < Base
      include ::Rails::Generators::ResourceHelpers
      argument     :actions, :type => :array,   :default => [],    :banner => "action action"

      check_class_collision :suffix => "ControllerTest"

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

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

      def accessible_attributes
        attributes.reject(&:reference?)
      end

      def attributes_hash
        return if accessible_attributes.empty?

        accessible_attributes.map do |a|
          name = a.name
          key_value name, "@#{singular_table_name}.#{name}"
        end.sort.join(', ')
      end
    end
  end
end
