require 'rails/generators/named_base'

# Ugh, Rails pukes on minitest -> MiniTest
# So name this "Minitest" to appease the Rails for now
module Minitest
  module Generators
    class Base < ::Rails::Generators::NamedBase #:nodoc:
      def self.source_root
        @_minitest_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'minitest', generator_name, 'templates'))
      end
    end
  end
end
