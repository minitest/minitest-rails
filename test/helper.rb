require "minitest/autorun"

require "rails"
require "rails/generators"

require "active_record"

require "action_controller"
require "action_controller/railtie"

require "action_mailer"

require "minitest-rails"
require "rails/test_help"
require "minitest/rails"

require "fakefs/safe"

class FakeFS::File
  def self.binread file
    File.open(file, "rb") { |f| f.read }
  end
end

class GeneratorTest < MiniTest::Unit::TestCase
  def setup
    Rails::Generators.no_color!
    FakeFS.activate!
    FakeFS::FileSystem.clone "lib/generators"
  end

  def teardown
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end
end
