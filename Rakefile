require "bundler"
require "bundler/setup"
require "bundler/gem_tasks"

require "rdoc/task"
RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.title = "minitest-rails"
  rdoc.rdoc_files.include "README.md", "lib/**/*.rb"
  rdoc.rdoc_dir = "doc"
end

require "rubocop/rake_task"
RuboCop::RakeTask.new

require "rake/testtask"
desc "Run tests."
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/test_*.rb"]
  t.warning = false
  t.verbose = false
end

namespace :test do
  desc "Run tests for all Rails versions"
  task "all" do
    Dir.glob("gemfiles/*.gemfile").each do |gemfile|
      Bundler.with_clean_env do
        sh "bundle --gemfile=#{gemfile} && bundle exec rake test"
      end
    end
  end
end

desc "Run the CI build"
task :ci do
  Rake::Task[:rubocop].invoke
  Rake::Task[:test].invoke
end

task default: :ci
