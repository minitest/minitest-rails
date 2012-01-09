require "generators/mini_test"

module MiniTest
  module Generators
    class IntegrationGenerator < Base
      class_option :spec, :type => :boolean, :default => false, :desc => "Use MiniTest::Spec DSL"

      check_class_collision :suffix => "IntegrationTest"

      def create_test_files
        if options[:spec]
          template "integration_spec.rb", "test/integration/#{file_name}_test.rb"
        else
          template "integration_test.rb", "test/integration/#{file_name}_test.rb"
        end
      end
    end
  end
end
