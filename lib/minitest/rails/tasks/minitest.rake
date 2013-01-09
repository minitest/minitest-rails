require "rake/testtask"
require "minitest/rails/testing"
require "minitest/rails/tasks/sub_test_task"

desc "Runs minitest"
task :test do
  # Add to existing task if exists, or create new task otherwise
  Rake::Task["minitest"].invoke
end

namespace "test" do
  task :prepare do
    # Define here in case test_unit isn't loaded
  end
end

# desc "Runs default tests (#{MiniTest::Rails::Testing.default_tasks.join(', ')})"
task :minitest do
  Rake::Task["minitest:default"].invoke
end

namespace "minitest" do

  # Only run the default tasks defined in MiniTest::Rails::Testing.default_tasks
  task :default do
    MiniTest::Rails::Testing.run_tests MiniTest::Rails::Testing.default_tasks
  end

  # Run all tests in all the test directories
  # desc "Runs all tests"
  task :all do
    MiniTest::Rails::Testing.run_tests MiniTest::Rails::Testing.all_tasks
  end

  MiniTest::Rails::Testing.all_tasks.each do |task_dir|
    unless Rake::Task.task_defined? "minitest:#{task_dir}"
      # desc "Runs tests under test/#{task_dir}"
      MiniTest::Rails::Tasks::SubTestTask.new(task_dir => "test:prepare") do |t|
        t.libs.push "test"
        t.pattern = "test/#{task_dir}/**/*_test.rb"
        t.options = MiniTest::Rails::Testing.task_opts[task_dir] if MiniTest::Rails::Testing.task_opts[task_dir]
      end
    end
  end

end

# Override the default task
task :default => [] # Just in case it hasn"t already been set
Rake::Task[:default].clear
desc "Runs default tests"
task :default => "minitest"
