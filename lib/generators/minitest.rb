require 'rails/generators/named_base'

module Minitest
  module Generators
    class Base < ::Rails::Generators::NamedBase #:nodoc:
      class_option :spec, type: :boolean, default: false,
                          desc: "Use Minitest::Spec DSL"

      def self.default_source_root
        File.expand_path(File.join(File.dirname(__FILE__), 'minitest', generator_name, 'templates'))
      end
    end
  end
end
