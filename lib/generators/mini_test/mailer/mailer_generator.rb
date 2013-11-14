require "generators/mini_test"

module MiniTest
  module Generators
    class MailerGenerator < Base
      argument     :actions, :type => :array,   :default => [],    :banner => "method method"

      check_class_collision :suffix => "MailerTest"

      def create_test_files
        if options[:spec]
          template "mailer_spec.rb", File.join("test","mailers", class_path, "#{file_name}_test.rb")
        else
          template "mailer_test.rb", File.join("test","mailers", class_path, "#{file_name}_test.rb")
        end
      end
    end
  end
end
