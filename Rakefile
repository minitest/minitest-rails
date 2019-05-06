require "bundler"
require "bundler/setup"
require "bundler/gem_tasks"

require "rubocop/rake_task"
RuboCop::RakeTask.new

require "rake/testtask"
desc "Run tests."
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/test_*.rb"]
  t.warning = false
end

desc "Run the CI build"
task :ci do
  Rake::Task[:rubocop].invoke
  Rake::Task[:test].invoke
end

task default: :ci
