# frozen_string_literal: true

require "rails/generators"
require "rails/generators/app_base"

module Minitest
  module Generators
    class InstallGenerator < ::Rails::Generators::AppBase
      class_option :skip_active_record, type: :boolean, default: false, desc: "Skip Active Record files"

      desc <<~DESC
        Description:
            Copy minitest files to your application.
      DESC

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), "templates"))
      end

      def copy_minitest_files
        empty_directory_with_keep_file "test/fixtures"
        empty_directory_with_keep_file "test/fixtures/files"
        empty_directory_with_keep_file "test/controllers"
        empty_directory_with_keep_file "test/mailers"
        empty_directory_with_keep_file "test/models"
        empty_directory_with_keep_file "test/helpers"
        empty_directory_with_keep_file "test/integration"

        template "test/channels/application_cable/connection_test.rb"
        template "test/application_system_test_case.rb"
        template "test/test_helper.rb"
      end
    end
  end
end
