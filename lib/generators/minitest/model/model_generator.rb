require 'generators/minitest'

module MiniTest
  module Generators
    class ModelGenerator < Base
      argument     :attributes, :type => :array,   :default => [], :banner => "field:type field:type"
      class_option :fixture,    :type => :boolean, :default => false, :desc => "Create fixture file"
      class_option :spec,       :type => :boolean, :default => false, :desc => "Use MiniTest::Spec DSL"

      check_class_collision :suffix => "Test"

      def create_test_files
        if options[:spec]
          template 'model_spec.rb', File.join('test/models', class_path, "#{file_name}_test.rb")
        else
          template 'model_test.rb', File.join('test/models', class_path, "#{file_name}_test.rb")
        end
        if options[:fixture]
          template 'fixtures.yml', File.join('test/fixtures', class_path, "#{plural_file_name}.yml")
        end
      end
    end
  end
end
