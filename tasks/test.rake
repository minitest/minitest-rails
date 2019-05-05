require "bundler"

namespace :test do
  desc "Run tests for Rails 6.0"
  task "6.0" do
    Bundler.with_clean_env do
      sh "rm -f Gemfile.lock"
      ENV["RAILS_VERSION"] = "5.0"
      sh "bundle && bundle exec rake test"
      sh "rm -f Gemfile.lock"
    end
  end

  desc "Run tests for Rails head"
  task "head" do
    Bundler.with_clean_env do
      sh "rm -f Gemfile.lock"
      ENV["RAILS_VERSION"] = "head"
      sh "bundle && bundle exec rake test"
      sh "rm -f Gemfile.lock"
    end
  end

  desc "Run tests for all Rails versions"
  task "all" do
    sh "rake test:6.0"
    sh "rake test:head"
  end
end
