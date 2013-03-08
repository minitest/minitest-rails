require 'rails/generators'

module MiniTest
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

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

    end
  end
end
