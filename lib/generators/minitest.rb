require 'rails/generators/named_base'

module Minitest
  module Generators
    class Base < ::Rails::Generators::NamedBase #:nodoc:

      class_option :old_style_hash, type: :boolean, default: false,
                                    desc: "Force using old style hash (:foo => 'bar') on Ruby >= 1.9"

      class_option :spec, type: :boolean, default: false,
                          desc: "Use Minitest::Spec DSL"

      def self.default_source_root
        File.expand_path(File.join(File.dirname(__FILE__), 'minitest', generator_name, 'templates'))
      end

      protected

      # Fill in methods that might be missing depending on the version of Rails

      def module_namespacing(&block)
        yield if block_given?
      end unless instance_methods(true).map(&:to_sym).include? :module_namespacing

      def key_value(key, value)
        if options[:old_style_hash] || RUBY_VERSION < '1.9'
          ":#{key} => #{value}"
        else
          "#{key}: #{value}"
        end
      end unless instance_methods(true).map(&:to_sym).include? :key_value

      def attributes_names
        @attributes_names ||= attributes.each_with_object([]) do |a, names|
          names << a.column_name
          names << "#{a.name}_type" if a.polymorphic?
        end
      end unless instance_methods(true).map(&:to_sym).include? :attributes_names

    end
  end
end
