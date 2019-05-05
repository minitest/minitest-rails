# frozen_string_literal: true

require "generators/minitest"

module Minitest # :nodoc:
  module Generators # :nodoc:
    class IntegrationGenerator < Base # :nodoc:
      check_class_collision suffix: "Test"

      def create_test_files
        template "integration_#{test_file_type}.rb", File.join("test/integration", class_path, "#{file_name}_test.rb")
      end

      private

      def file_name
        @_file_name ||= super.sub(/_test\z/i, "")
      end
    end
  end
end
