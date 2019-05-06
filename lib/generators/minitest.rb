# frozen_string_literal: true

require "rails/generators/named_base"

module Minitest
  module Generators
    class Base < ::Rails::Generators::NamedBase #:nodoc:
      class_option :spec, type: :boolean, default: true,
                          desc: "Use Minitest::Spec DSL"
      class_option :spec_expectation_monad, type: :string, default: "value",
                                            desc: "Spec DSL's expectation value mondad (options: value, expect, _)"

      def self.default_source_root
        File.expand_path(File.join(File.dirname(__FILE__), "minitest", generator_name, "templates"))
      end

      def test_file_type
        return "spec" if options[:spec]

        "test"
      end

      def spec_expectation_monad
        monad = options[:spec_expectation_monad]
        return monad if %w[value expect _].include? monad

        "value"
      end
    end
  end
end
