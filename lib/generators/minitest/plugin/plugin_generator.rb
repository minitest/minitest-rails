require 'generators/minitest'

module MiniTest
  module Generators
    class PluginGenerator < MiniTest::Rails::Generators::Base
      check_class_collision :suffix => "Test"

      def create_test_files
        directory '.', 'test'
      end
    end
  end
end
