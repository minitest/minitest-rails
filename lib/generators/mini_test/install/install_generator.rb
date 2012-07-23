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
        directory 'test'
      end

      def require_minitest_rails
        application %Q{\n    #added by minitest-rails install generator\n    require "minitest-rails"\n}
      end
    end
  end
end
