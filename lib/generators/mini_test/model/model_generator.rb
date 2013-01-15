require "generators/mini_test"

module MiniTest
  module Generators
    class ModelGenerator < Base
      argument     :attributes, :type => :array,   :default => [],    :banner => "field:type field:type"
      class_option :fixture,    :type => :boolean, :default => true,  :desc => "Create fixture file"

      check_class_collision :suffix => "Test"

      def create_test_file
        if options[:spec]
          template "model_spec.rb", "test/models/#{file_name}_test.rb"
        else
          template "model_test.rb", "test/models/#{file_name}_test.rb"
        end
      end

      hook_for :fixture_replacement

      def create_fixture_file
        if options[:fixture] && options[:fixture_replacement].nil?
          template "fixtures.yml", "test/fixtures/#{plural_file_name}.yml"
        end
      end
    end
  end
end
