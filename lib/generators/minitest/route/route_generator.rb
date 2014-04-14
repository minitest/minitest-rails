require "generators/minitest"

module Minitest
  module Generators
    class RouteGenerator < ::Rails::Generators::Base

      class_option :spec, type: :boolean, default: false,
                          desc: "Use Minitest::Spec DSL"

      desc <<DESC
Description:
    Creates a route test.
DESC

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def create_test_files
        if options[:spec]
          template "route_spec.rb", File.join("test", "routes", "route_test.rb")
        else
          template "route_test.rb", File.join("test", "routes", "route_test.rb")
        end
      end
    end
  end
end
