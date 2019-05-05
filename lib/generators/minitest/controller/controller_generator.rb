# frozen_string_literal: true

require "generators/minitest"

module Minitest # :nodoc:
  module Generators # :nodoc:
    class ControllerGenerator < Base # :nodoc:
      argument :actions, type: :array, default: [], banner: "action action"
      check_class_collision suffix: "ControllerTest"

      def create_test_files
        template "functional_#{test_file_type}.rb",
                 File.join("test/controllers", class_path, "#{file_name}_controller_test.rb")
      end
    end
  end
end
