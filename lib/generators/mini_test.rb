require 'rails/generators/named_base'

module MiniTest
  module Generators
    class Base < ::Rails::Generators::NamedBase #:nodoc:
      def self.source_root
        @_minitest_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'mini_test', generator_name, 'templates'))
      end

      begin
        # This method doesn't exist in Rails 3.0
        def module_namespacing(&block)
          yield if block_given?
        end
      end unless respond_to?(:module_namespacing)
    end
  end
end
