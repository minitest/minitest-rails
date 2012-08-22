require "generators/mini_test"

module MiniTest
  module Generators
    class ModelGenerator < Base
      argument     :attributes, :type => :array,   :default => [],    :banner => "field:type field:type"
      class_option :fixture,    :type => :boolean, :default => true,  :desc => "Create fixture file"
      class_option :spec,       :type => :boolean, :default => false, :desc => "Use MiniTest::Spec DSL"

      check_class_collision :suffix => "Test"

      def create_test_file
        template "model_#{format}.rb", "#{format}/models/#{file_name}_#{format}.rb"
      end

      hook_for :fixture_replacement

      def create_fixture_file
        if options[:fixture] && options[:fixture_replacement].nil?
          template "fixtures.yml", "#{format}/fixtures/#{plural_file_name}.yml"
        end
      end

      private

      def format
        options.spec? ? "spec" : "test"
      end
    end
  end
end
