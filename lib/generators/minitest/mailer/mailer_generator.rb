require "generators/minitest"

module Minitest
  module Generators
    class MailerGenerator < Base
      argument :actions, type: :array, default: [], banner: "method method"

      def check_class_collision
        class_collisions "#{class_name}Test", "#{class_name}Preview"
      end

      def create_test_files
        if options[:spec]
          template_file = "mailer_spec.rb"
        else
          template_file = "mailer_test.rb"
        end
        template template_file,
                 File.join("test/mailers", class_path, "#{file_name}_test.rb")
      end

      def create_preview_files
        template "preview.rb", File.join("test/mailers/previews", class_path, "#{file_name}_preview.rb")
      end
    end
  end
end
