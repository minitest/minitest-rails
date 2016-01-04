namespace :test do
  desc "Run tests for Rails 5.0"
  task "5.0" do
    ENV['BUNDLE_GEMFILE'] = 'gemfiles/5.0.gemfile'
    sh "bundle && bundle exec rake test"
  end

  desc "Run tests for Rails 4.2"
  task "4.2" do
    ENV['BUNDLE_GEMFILE'] = 'gemfiles/4.2.gemfile'
    sh "bundle && bundle exec rake test"
  end

  desc "Run tests for all Rails versions"
  task "all" => [ 'test:5.0', 'test:4.2' ]
end
