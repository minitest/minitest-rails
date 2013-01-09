require "rake/testtask"

module MiniTest
  module Rails
    module Testing
      mattr_accessor :default_tasks
      mattr_accessor :task_opts

      self.default_tasks = %w(models helpers controllers mailers integration)
      self.task_opts = { "performance" => "-- --benchmark" }

      def self.all_tasks
        Dir["test/*/"].map {|dir| /test\/(.+?)\//.match(dir)[1] }.select do |dir|
          !Dir.glob("test/#{dir}/**/*_test.rb").empty?
        end
      end

      def self.run_tests directories
        errors = directories.collect do |dir|
          task = "minitest:#{dir}"
          begin
            if Rake::Task.task_defined? task
              Rake::Task[task].invoke
            end
            nil
          rescue => e
            { :task => task, :exception => e }
          end
        end.compact

        if errors.any?
          puts errors.map { |e| "Errors running #{e[:task]}! #{e[:exception].inspect}" }.join("\n")
          abort
        end
      end

    end
  end
end
