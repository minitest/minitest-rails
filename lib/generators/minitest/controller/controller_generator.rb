require 'generators/minitest'

module MiniTest::Generators
  class ControllerGenerator < Base
    argument :actions, :type => :array, :default => [], :banner => "action action"
    check_class_collision :suffix => "ControllerTest"

    def create_test_files
      template 'controller_test.rb',
               File.join('test/controller', class_path, "#{file_name}_controller_test.rb")
    end
  end
end
