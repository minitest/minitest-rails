require "generators/minitest"

module Minitest
  module Generators
    class HelperGenerator < Base
      class_option :spec,    :type => :boolean, :default => false, :desc   => "Use Minitest::Spec DSL"

      check_class_collision :suffix => "HelperTest"

      def create_test_files
        if options[:spec]
          template "helper_spec.rb", "test/helpers/#{file_name}_helper_test.rb"
        else
          template "helper_test.rb", "test/helpers/#{file_name}_helper_test.rb"
        end
      end
    end
  end
end
