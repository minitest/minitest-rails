namespace :test do
  desc "Run tests for Rails 4.0"
  task "4.0" do
    sh "rm -f Gemfile.lock"
    ENV["RAILS_VERSION"] = "4.0"
    sh "bundle && bundle exec rake test"
    sh "rm -f Gemfile.lock"
  end

  desc "Run tests for Rails 3.2"
  task "3.2" do
    sh "rm -f Gemfile.lock"
    ENV["RAILS_VERSION"] = "3.2"
    sh "bundle && bundle exec rake test"
    sh "rm -f Gemfile.lock"
  end

  desc "Run tests for Rails 3.1"
  task "3.1" do
    sh "rm -f Gemfile.lock"
    ENV["RAILS_VERSION"] = "3.1"
    sh "bundle && bundle exec rake test"
    sh "rm -f Gemfile.lock"
  end

  desc "Run tests for Rails 3.0"
  task "3.0" do
    sh "rm -f Gemfile.lock"
    ENV["RAILS_VERSION"] = "3.0"
    sh "bundle && bundle exec rake test"
    sh "rm -f Gemfile.lock"
  end

  desc "Run tests for all Rails versions"
  task "all" do
    sh "rake test:4.0"
    sh "rake test:3.2"
    sh "rake test:3.1"
    sh "rake test:3.0"
  end
end
