require 'rails/generators'

module Minitest
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      class_option :active_record, type: :boolean, default: true, desc: "Add ActiveRecord configuration"

      desc <<DESC
Description:
    Copy minitest files to your application.
DESC

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def copy_minitest_files
        template 'test_helper.rb', File.join("test", "test_helper.rb")
      end

      def add_migration_check
        ::Rails::VERSION::STRING >= "4.0"
      end

    end
  end
end
