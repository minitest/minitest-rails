require "generators/minitest"

module Minitest
  module Generators
    class JobGenerator < Base
      check_class_collision suffix: 'JobTest'

      def create_test_files
        if options[:spec]
          template_file = "job_spec.rb"
        else
          template_file = "job_test.rb"
        end
        template template_file,
                 File.join("test/jobs", class_path, "#{file_name}_job_test.rb")
      end
    end
  end
end
