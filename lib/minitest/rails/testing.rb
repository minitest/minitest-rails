require "rake/testtask"

module MiniTest
  module Rails
    module Testing
      mattr_accessor :default_tasks
      mattr_accessor :task_opts

      ##
      # The default tasks that are to be run by <tt>rake minitest</tt>.
      #
      #     # Add test/presenters to default test task
      #     MiniTest::Rails::Testing.default_tasks << "presenters"
      #
      # Default values are: models helpers controllers mailers integration
      # :attr: default_tasks
      self.default_tasks = %w(models helpers controllers mailers integration)

      ##
      # Retreive all the directories that have tests in them.
      def self.all_tasks
        Dir["test/*/"].map {|dir| /test\/(.+?)\//.match(dir)[1] }.select do |dir|
          !Dir.glob("test/#{dir}/**/*_test.rb").empty?
        end
      end

    end
  end
end
