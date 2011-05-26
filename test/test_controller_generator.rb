require "minitest/autorun"
require "minitest-rails"

require 'rails'
require 'rails/generators'

require 'generators/minitest/controller/controller_generator'

require 'fileutils'

class TestControllerGenerator < MiniTest::Unit::TestCase
  Rails::Generators.no_color!

  def test_controller_generator
    text = capture(:stdout) do
      MiniTest::Generators::ControllerGenerator.start ['user']
    end
    assert_equal "      create  test/controllers/user_controller_test.rb\n", text
    assert File.exists? 'test/controllers/user_controller_test.rb'
    contents = open('test/controllers/user_controller_test.rb').read
    assert_match /class UserControllerTest < MiniTest::Unit::TestCase/m, contents
  ensure
    # TODO: Don't write the files
    # I agree, it would be better to mock the file getting written
    FileUtils.rm_r 'test/controllers'
  end

  def test_controller_generator_spec
    text = capture(:stdout) do
      MiniTest::Generators::ControllerGenerator.start ['user', '--spec']
    end
    assert_equal "      create  test/controllers/user_controller_test.rb\n", text
    assert File.exists? 'test/controllers/user_controller_test.rb'
    contents = open('test/controllers/user_controller_test.rb').read
    assert_match /describe UserController do/m, contents
  ensure
    FileUtils.rm_r 'test/controllers'
  end
end
