require "helper"
require "generators/minitest/job/job_generator"

class TestJobGenerator < GeneratorTest
  tests Minitest::Generators::JobGenerator

  def test_job_generator
    output = run_generator %w[user_invite --no-spec]
    assert_match %r{create  test/jobs/user_invite_job_test.rb}m, output

    Dir.chdir self.class.destination_root
    # assert_output(/create  test\/jobs\/user_invite_job_test.rb/m) do
    #   Minitest::Generators::JobGenerator.start ["user_invite", "--no-spec"]
    # end
    assert File.exist? "test/jobs/user_invite_job_test.rb"
    contents = File.read "test/jobs/user_invite_job_test.rb"
    assert_match(/class UserInviteJobTest < ActiveJob::TestCase/m, contents)
  end

  def test_namespaced_job_generator
    output = run_generator %w[admin/user_invite --no-spec]
    assert_match %r{create  test/jobs/admin/user_invite_job_test.rb}m, output

    Dir.chdir self.class.destination_root
    # assert_output(/create  test\/jobs\/admin\/user_invite_job_test.rb/m) do
    #   Minitest::Generators::JobGenerator.start ["admin/user_invite", "--no-spec"]
    # end
    assert File.exist? "test/jobs/admin/user_invite_job_test.rb"
    contents = File.read "test/jobs/admin/user_invite_job_test.rb"
    assert_match(/class Admin::UserInviteJobTest < ActiveJob::TestCase/m, contents)
  end

  def test_job_generator_spec
    output = run_generator %w[user_invite]
    assert_match %r{create  test/jobs/user_invite_job_test.rb}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/jobs/user_invite_job_test.rb"
    contents = File.read "test/jobs/user_invite_job_test.rb"
    assert_match(/describe UserInviteJob do/m, contents)
  end

  def test_namespaced_job_generator_spec
    output = run_generator %w[admin/user_invite]
    assert_match %r{create  test/jobs/admin/user_invite_job_test.rb}m, output

    Dir.chdir self.class.destination_root
    assert File.exist? "test/jobs/admin/user_invite_job_test.rb"
    contents = File.read "test/jobs/admin/user_invite_job_test.rb"
    assert_match(/describe Admin::UserInviteJob do/m, contents)
  end
end
