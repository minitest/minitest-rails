require 'generators/minitest'

module MiniTest
  module Generators
    class ObserverGenerator < MiniTest::Rails::Generators::Base
      check_class_collision :suffix => "ObserverTest"

      def create_test_files
        template 'unit_test.rb',  File.join('test/unit', class_path, "#{file_name}_observer_test.rb")
      end
    end
  end
end
