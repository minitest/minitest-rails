require "helper"

if defined? ActiveJob # Rails 4.2 and later.
  require "generators/minitest/job/job_generator"

  class TestJobGenerator < GeneratorTest

    def test_job_generator
      assert_output(/create  test\/jobs\/user_invite_job_test.rb/m) do
        Minitest::Generators::JobGenerator.start ["user_invite"]
      end
      assert File.exists? "test/jobs/user_invite_job_test.rb"
      contents = File.read "test/jobs/user_invite_job_test.rb"
      assert_match(/class UserInviteJobTest < ActiveJob::TestCase/m, contents)
    end

    def test_namespaced_job_generator
      assert_output(/create  test\/jobs\/admin\/user_invite_job_test.rb/m) do
        Minitest::Generators::JobGenerator.start ["admin/user_invite"]
      end
      assert File.exists? "test/jobs/admin/user_invite_job_test.rb"
      contents = File.read "test/jobs/admin/user_invite_job_test.rb"
      assert_match(/class Admin::UserInviteJobTest < ActiveJob::TestCase/m, contents)
    end

    def test_job_generator_spec
      assert_output(/create  test\/jobs\/user_invite_job_test.rb/m) do
        Minitest::Generators::JobGenerator.start ["user_invite", "--spec"]
      end
      assert File.exists? "test/jobs/user_invite_job_test.rb"
      contents = File.read "test/jobs/user_invite_job_test.rb"
      assert_match(/describe UserInviteJob do/m, contents)
    end

    def test_namespaced_job_generator_spec
      assert_output(/create  test\/jobs\/admin\/user_invite_job_test.rb/m) do
        Minitest::Generators::JobGenerator.start ["admin/user_invite", "--spec"]
      end
      assert File.exists? "test/jobs/admin/user_invite_job_test.rb"
      contents = File.read "test/jobs/admin/user_invite_job_test.rb"
      assert_match(/describe Admin::UserInviteJob do/m, contents)
    end

  end
end
