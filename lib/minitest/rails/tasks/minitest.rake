require 'rake/testtask'
require 'minitest/rails/tasks/sub_test_task'

# The default tests to run, update this list to change behavior
MINITEST_TASKS = %w(models helpers controllers mailers acceptance) #views

def all_directories_under_test
  Dir['test/*/'].map {|dir| /test\/(.+?)\//.match(dir)[1] }
end

def all_minitest_directories
  (MINITEST_TASKS + all_directories_under_test).uniq
end

desc "Runs minitest"
task :test do
  # Add to existing task if exists, or create new task otherwise
  Rake::Task['minitest'].invoke
end

namespace 'test' do
  task :prepare do
    # Define here in case test_unit isn't loaded
  end
end

desc "Runs #{MINITEST_TASKS.join(", ")} together"
task :minitest do
  Rake::Task['minitest:default'].invoke
end

namespace 'minitest' do

  # Only run the default tasks defined in MINITEST_TASKS
  task :default do
    errors = MINITEST_TASKS.collect do |task|
      begin
        Rake::Task["minitest:#{task}"].invoke
        nil
      rescue => e
        { :task => "minitest:#{task}", :exception => e }
      end
    end.compact

    if errors.any?
      puts errors.map { |e| "Errors running #{e[:task]}! #{e[:exception].inspect}" }.join("\n")
      abort
    end
  end

  # Run all tests in all the test directories
  task :all do
    errors = all_minitest_directories.collect do |task|
      begin
        Rake::Task["minitest:#{task}"].invoke
        nil
      rescue => e
        { :task => "minitest:#{task}", :exception => e }
      end
    end.compact

    if errors.any?
      puts errors.map { |e| "Errors running #{e[:task]}! #{e[:exception].inspect}" }.join("\n")
      abort
    end
  end

  all_minitest_directories.each do |task|
    MiniTest::Rails::Tasks::SubTestTask.new(task => 'test:prepare') do |t|
      t.libs.push 'test'
      t.pattern = "test/#{task}/**/*_test.rb"
    end
  end

end
