require "minitest/autorun"
require "minitest-rails"

require "rails"
require "rails/generators"

require "generators/minitest/install/install_generator"

require "fileutils"

class TestInstallGenerator < Minitest::Unit::TestCase
  Rails::Generators.no_color!

  def test_install_generator
    text = capture(:stdout) do
      Minitest::Generators::InstallGenerator.start
    end
    assert_match(/create  test\/minitest_helper.rb/m, text)
    assert File.exists? "test/minitest_helper.rb"
    contents = open("test/minitest_helper.rb").read
    assert_match(/class Minitest::Rails::Spec/m, contents)
    assert_match(/# include Minitest::Rails::Fixtures/m, contents)
    assert_match(/class Minitest::Rails::Model/m, contents)
    assert_match(/Minitest::Spec.register_spec_type\(Minitest::Rails::Model\) do/m, contents)
    assert_match(/class Minitest::Rails::Controller/m, contents)
    assert_match(/Minitest::Spec.register_spec_type\(\/Controller\$\/, Minitest::Rails::Controller\)/m, contents)
    assert_match(/class Minitest::Rails::Helper/m, contents)
    assert_match(/Minitest::Spec.register_spec_type\(\/Helper\$\/, Minitest::Rails::Helper\)/m, contents)
    assert_match(/class Minitest::Rails::Mailer/m, contents)
    assert_match(/Minitest::Spec.register_spec_type\(Minitest::Rails::Mailer\) do/m, contents)
  ensure
    # TODO: Don"t write the files
    # I agree, it would be better to mock the file getting written
    FileUtils.rm "test/minitest_helper.rb"
  end
end
