require 'rails/generators/named_base'

module MiniTest
  module Generators
    class Base < ::Rails::Generators::NamedBase #:nodoc:
      def self.source_root
        @_minitest_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'mini_test', generator_name, 'templates'))
      end

      if ::Rails.version.to_f < 3.1
        protected
        # These methods don't exist in Rails 3.0
        def module_namespacing(&block)
          yield if block_given?
        end
        def key_value(key, value)
          if options[:old_style_hash] || RUBY_VERSION < '1.9'
            ":#{key} => #{value}"
          else
            "#{key}: #{value}"
          end
        end
      end
    end
  end
end
