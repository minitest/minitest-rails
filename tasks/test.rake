namespace :test do
  desc "Run tests for Rails 4.1"
  task "4.1" do
    sh "rm -f Gemfile.lock"
    ENV["RAILS_VERSION"] = "4.1"
    sh "bundle && bundle exec rake test"
    sh "rm -f Gemfile.lock"
  end

  desc "Run tests for all Rails versions"
  task "all" do
    sh "rake test:4.1"
  end
end
