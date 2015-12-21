namespace :test do
  desc "Run tests for Rails 5.0"
  task "5.0" do
    sh "rm -f Gemfile.lock"
    ENV["RAILS_VERSION"] = "5.0"
    sh "bundle && bundle exec rake test"
    sh "rm -f Gemfile.lock"
  end

  desc "Run tests for Rails 4.2"
  task "4.2" do
    sh "rm -f Gemfile.lock"
    ENV["RAILS_VERSION"] = "4.2"
    sh "bundle && bundle exec rake test"
    sh "rm -f Gemfile.lock"
  end

  desc "Run tests for all Rails versions"
  task "all" do
    sh "rake test:5.0"
  end
end
