require "generators/mini_test"

module MiniTest
  module Generators
    class HelperGenerator < Base
      class_option :spec,    :type => :boolean, :default => false, :desc   => "Use MiniTest::Spec DSL"

      check_class_collision :suffix => "HelperTest"

      def create_test_files
        format = options.spec? ? "spec" : "test"
        template "helper_#{format}.rb", File.join(
          format, "helpers", class_path, "#{file_name}_helper_#{format}.rb"
        )
      end

    end
  end
end
