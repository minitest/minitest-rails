namespace :gemfiles do
  desc "Updates the gemfiles"
  task :update do
    `bundle --gemfile=gemfiles/3.0.gemfile`
    `bundle --gemfile=gemfiles/3.1.gemfile`
    `bundle --gemfile=gemfiles/3.2.gemfile`
  end
  desc "Clear the gemfile lock files"
  task :clear do
    `rm gemfiles/3.*.gemfile.lock`
  end
end

Rake::Task["gem:spec"].enhance do
  Rake::Task["gemfiles:update"].invoke
end
