require "helper"

if defined? ActiveJob # Rails 4.2 and later.
  class TestActiveJobAssertions < ActiveJob::TestCase
    def test_assert_enqueued_jobs
      assert_enqueued_jobs 0
      UserInviteJob.logger.silence { UserInviteJob.perform_later }
      assert_enqueued_jobs 1
    end

    def test_assert_no_enqueued_jobs
      assert_no_enqueued_jobs
      UserInviteJob.new
      assert_no_enqueued_jobs
    end

    def test_assert_performed_jobs
      assert_performed_jobs 0
      assert_performed_jobs 2 do
        UserInviteJob.logger.silence do
          UserInviteJob.perform_later
          UserInviteJob.perform_later
        end
      end
    end

    def test_assert_no_performed_jobs
      assert_no_performed_jobs
      assert_no_performed_jobs do
        UserInviteJob.new
      end
    end

    def test_assert_enqueued_with
      assert_enqueued_with job: UserInviteJob, args: [209] do
        UserInviteJob.logger.silence { UserInviteJob.perform_later(209) }
      end
    end

    def test_assert_performed_with
      assert_performed_with job: UserInviteJob, args: [107] do
        UserInviteJob.logger.silence { UserInviteJob.perform_later(107) }
      end
    end
  end
end
