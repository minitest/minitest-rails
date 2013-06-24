require "rake/testtask"
require "minitest/rails/testing"
require "minitest/rails/tasks/sub_test_task"

task stats: 'test:setup_stats'

namespace "test" do
  task :prepare do
    # Define here in case test_unit isn't loaded
  end

  task :setup_stats do
    require 'rails/code_statistics'
    dirs = Dir['./test/**/*_test.rb'].map { |f| f.sub(/^\.\/(test\/\w+)\/.*/, '\\1') }.uniq
    dirs.each do |dir|
      name = dir.split('/').last
      ::STATS_DIRECTORIES << ["#{name.singularize.capitalize} tests", dir]
      ::CodeStatistics::TEST_TYPES << "#{name.singularize.capitalize} tests"
    end
  end
end

desc "Run default tests"
task :minitest do
  Rake::Task["minitest:default"].invoke
end

namespace "minitest" do

  # Only run the default tasks defined in MiniTest::Rails::Testing.default_tasks
  task :default do
    if ENV["TEST"]
      Rake::Task["minitest:single"].invoke
    else
      MiniTest::Rails::Testing.run_tests MiniTest::Rails::Testing.default_tasks
    end
  end

  desc "Run all tests"
  task :all do
    MiniTest::Rails::Testing.run_tests MiniTest::Rails::Testing.all_tasks
  end
  namespace "all" do
    desc "Run all tests, ungrouped for quicker execution"
    MiniTest::Rails::Tasks::SubTestTask.new(:quick => "test:prepare") do |t|
      t.libs.push "test"
      t.pattern = "test/**/*_test.rb"
    end
  end

  MiniTest::Rails::Tasks::SubTestTask.new(:single => "test:prepare") do |t|
    t.libs << "test"
  end

  MiniTest::Rails::Testing.all_tasks.each do |task_dir|
    unless Rake::Task.task_defined? "minitest:#{task_dir}"
      desc "Runs tests under test/#{task_dir}"
      MiniTest::Rails::Tasks::SubTestTask.new(task_dir => "test:prepare") do |t|
        t.libs.push "test"
        t.pattern = "test/#{task_dir}/**/*_test.rb"
        t.options = MiniTest::Rails::Testing.task_opts[task_dir] if MiniTest::Rails::Testing.task_opts[task_dir]
      end
    end
  end

end

# Statistics

# set hook on stats task
task :stats => "minitest:setup_stats"

namespace "minitest" do
  task :setup_stats do
    require "rails/code_statistics"

    # Clear existing test directories
    STATS_DIRECTORIES.reject! { |name, dir| dir.starts_with? Rails.root.join("test").to_s }
    CodeStatistics::TEST_TYPES.clear

    # Add test directories that minitest-rails knows about
    MiniTest::Rails::Testing.all_tasks.each do |dir|
      name = "#{dir.capitalize} tests"
      STATS_DIRECTORIES << [ name, Rails.root.join("test").join(dir).to_s ]
      CodeStatistics::TEST_TYPES << name
    end
  end
end

# Override the test task
task :test => [] # Just in case it hasn't already been set
Rake::Task[:test].clear
desc "Run default tests"
task :test => "minitest"

# Override the default task
task :default => [] # Just in case it hasn't already been set
Rake::Task[:default].clear
task :default => "minitest"
