require 'rake/testtask'
require 'rails/test_unit/sub_test_task'

TASKS = %w(models controllers helpers mailers acceptance) #views
MINITEST_TASKS = TASKS.map { |sub| "minitest:#{sub}" }

desc "Runs minitest"
task :test do
  Rake::Task['minitest'].invoke
end

desc "Runs #{MINITEST_TASKS.join(", ")} together"
task :minitest do
  Rake::Task['minitest:run'].invoke
end

namespace 'minitest' do

  task :run do
    errors = MINITEST_TASKS.collect do |task|
      begin
        Rake::Task[task].invoke
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

  TASKS.each do |sub|
    Rails::SubTestTask.new(sub => 'test:prepare') do |t|
      t.libs.push 'test'
      t.pattern = "test/#{sub}/**/*_test.rb"
    end
  end

end
