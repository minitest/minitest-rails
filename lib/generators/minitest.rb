require 'rails/generators/named_base'

module Minitest
  module Generators
    class Base < ::Rails::Generators::NamedBase #:nodoc:
      class_option :spec, type: :boolean, default: true,
                          desc: "Use Minitest::Spec DSL"

      def self.default_source_root
        File.expand_path(File.join(File.dirname(__FILE__), 'minitest', generator_name, 'templates'))
      end

      def show_helper
        "#{singular_table_name}_url(#{singular_table_name})"
      end
    end
  end
end
