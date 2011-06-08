require 'rake/testtask'

MINITEST_TASKS = %w(models controllers helpers mailers) #views integration

desc 'Runs all tests'
task :test do
  errors = MINITEST_TASKS.collect do |task|
    begin
      Rake::Task["test:#{task}"].invoke
      nil
    rescue => e
      task
    end
  end.compact
  abort "Errors running #{errors * ', '}!" if errors.any?
end

namespace :test do
  task :prepare do
    # Placeholder task for other Railtie and plugins to enhance. See Active Record for an example.
  end

  MINITEST_TASKS.each do |sub|
    Rake::TestTask.new(sub => 'test:prepare') do |t|
      t.libs << 'test'
      t.pattern = "test/#{sub}/**/*_test.rb"
    end
  end
end
