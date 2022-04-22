require "helper"
require "generators/minitest/scaffold/scaffold_generator"

class TestScaffoldGenerator < GeneratorTest
  tests Minitest::Generators::ScaffoldGenerator

  def test_scaffold_generator
    output = run_generator %w[User name:string email:string --no-spec]
    assert_match %r{create  test/controllers/users_controller_test.rb}m, output

    Dir.chdir self.class.destination_root
    # assert_output(/create  test\/controllers\/users_controller_test.rb/m) do
    #   Minitest::Generators::ScaffoldGenerator.start ["User", "name:string", "email:string", "--no-spec"]
    # end
    assert File.exist? "test/controllers/users_controller_test.rb"

    contents = File.read "test/controllers/users_controller_test.rb"
    assert_match(/class UsersControllerTest/m, contents)
    assert_match(/post users_url, params: { user: { email: @user.email, name: @user.name } }/m, contents)
  end

  def test_scaffold_generator_spec
    output = run_generator %w[User name:string email:string --spec]
    assert_match %r{create  test/controllers/users_controller_test.rb}m, output

    Dir.chdir self.class.destination_root
    # assert_output(/create  test\/controllers\/users_controller_test.rb/m) do
    #   Minitest::Generators::ScaffoldGenerator.start ["User", "name:string", "email:string"]
    # end
    assert File.exist? "test/controllers/users_controller_test.rb"
    contents = File.read "test/controllers/users_controller_test.rb"
    assert_match(/describe UsersController do/m, contents)
    assert_match(/post users_url, params: { user: { email: @user.email, name: @user.name } }/m, contents)
  end
end
