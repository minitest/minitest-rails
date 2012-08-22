require "generators/mini_test"
require "rails/generators/resource_helpers"

module MiniTest
  module Generators
    class ScaffoldGenerator < Base
      include ::Rails::Generators::ResourceHelpers
      argument     :actions, :type => :array,   :default => [],    :banner => "action action"
      class_option :spec,    :type => :boolean, :default => false, :desc   => "Use MiniTest::Spec DSL"

      check_class_collision :suffix => "ControllerTest"

      def create_test_files
        format = options.spec? ? "spec" : "test"

        template "controller_#{format}.rb", File.join(
          format, "controllers", class_path,
          "#{controller_file_name}_controller_#{format}.rb"
        )
      end

    end
  end
end
