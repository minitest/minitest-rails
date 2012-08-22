require "generators/mini_test"

module MiniTest
  module Generators
    class ControllerGenerator < Base
      argument     :actions, :type => :array,   :default => [],    :banner => "action action"
      class_option :spec,    :type => :boolean, :default => false, :desc   => "Use MiniTest::Spec DSL"

      check_class_collision :suffix => "ControllerTest"

      def create_test_files
        format = options.spec? ? "spec" : "test"
        template "controller_#{format}.rb", File.join(
          format, "controllers", class_path, "#{file_name}_controller_#{format}.rb"
        )
      end

    end
  end
end
