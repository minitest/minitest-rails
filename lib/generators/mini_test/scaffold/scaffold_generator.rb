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
        if options[:spec]
          template "controller_spec.rb", File.join("test/controllers", class_path, "#{file_name}_controller_test.rb")
        else
          template "controller_test.rb", File.join("test/controllers", class_path, "#{file_name}_controller_test.rb")
        end
      end
    end
  end
end
