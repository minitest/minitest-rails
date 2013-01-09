namespace :gemfiles do
  desc "Updates the gemfiles"
  task :update do
    `bundle --gemfile=gemfiles/3.0.gemfile`
    `bundle --gemfile=gemfiles/3.1.gemfile`
    `bundle --gemfile=gemfiles/3.2.gemfile`
    `bundle --gemfile=gemfiles/4.0.gemfile`
  end
  desc "Clear the gemfile lock files"
  task :clear do
    `rm gemfiles/*.gemfile.lock`
  end
end

# Building this in case it doesn't exist
# /me shakes fist at travis-ci
namespace :gem do
  task :spec do
  end
end

Rake::Task["gem:spec"].enhance do
  Rake::Task["gemfiles:update"].invoke
end
