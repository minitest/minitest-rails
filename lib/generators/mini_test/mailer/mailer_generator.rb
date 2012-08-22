require "generators/mini_test"

module MiniTest
  module Generators
    class MailerGenerator < Base
      argument     :actions, :type => :array,   :default => [],    :banner => "method method"
      class_option :spec,    :type => :boolean, :default => false, :desc => "Use MiniTest::Spec DSL"

      check_class_collision :suffix => "MailerTest"

      def create_test_files
        format = options.spec? ? "spec" : "test"
        template "mailer_#{format}.rb", "#{format}/mailers/#{file_name}_#{format}.rb"
      end

    end
  end
end
