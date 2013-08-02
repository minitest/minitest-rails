namespace :test do
  desc "Run tests against the 3.0 gemfile"
  task "3.0" do
    ENV["BUNDLE_GEMFILE"] = "gemfiles/3.0.gemfile"
    sh "bundle exec rake test"
  end

  desc "Run tests against the 3.1 gemfile"
  task "3.1" do
    ENV["BUNDLE_GEMFILE"] = "gemfiles/3.1.gemfile"
    sh "bundle exec rake test"
  end

  desc "Run tests against the 3.2 gemfile"
  task "3.2" do
    ENV["BUNDLE_GEMFILE"] = "gemfiles/3.2.gemfile"
    sh "bundle exec rake test"
  end

  desc "Run tests against the 4.0 gemfile"
  task "4.0" do
    ENV["BUNDLE_GEMFILE"] = "gemfiles/4.0.gemfile"
    sh "bundle exec rake test"
  end

  desc "Run tests against all rails version gemfiles"
  task "all" do
    sh "rake test:3.0"
    sh "rake test:3.1"
    sh "rake test:3.2"
    sh "rake test:4.0"
  end
end

