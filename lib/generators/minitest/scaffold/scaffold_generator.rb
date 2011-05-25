require 'generators/minitest'
require 'rails/generators/resource_helpers'

module MiniTest
  module Generators
    class ScaffoldGenerator < MiniTest::Rails::Generators::Base
      include Rails::Generators::ResourceHelpers

      check_class_collision :suffix => "ControllerTest"

      def create_test_files
        template 'functional_test.rb',
                 File.join('test/functional', controller_class_path, "#{controller_file_name}_controller_test.rb")
      end
    end
  end
end
