require "helper"

if defined? ActiveJob # Rails 4.2 and later.
  module ActiveJobExpectationTests
    def test_must_enqueue_jobs
      must_enqueue_jobs 0
      UserInviteJob.logger.silence { UserInviteJob.perform_later }
      must_enqueue_jobs 1
    end

    def test_wont_enqueue_jobs
      wont_enqueue_jobs
      UserInviteJob.new
      wont_enqueue_jobs
    end

    def test_must_perform_jobs
      must_perform_jobs 0
      must_perform_jobs 2 do
        UserInviteJob.logger.silence do
          UserInviteJob.perform_later
          UserInviteJob.perform_later
        end
      end
    end

    def test_wont_perform_jobs
      wont_perform_jobs
      wont_perform_jobs do
        UserInviteJob.new
      end
    end

    def test_must_enqueue_with
      must_enqueue_with job: UserInviteJob, args: [209] do
        UserInviteJob.logger.silence { UserInviteJob.perform_later(209) }
      end
    end

    def test_must_perform_with
      must_perform_with job: UserInviteJob, args: [107] do
        UserInviteJob.logger.silence { UserInviteJob.perform_later(107) }
      end
    end
  end

  class TestActiveJobExpectations < ActiveJob::TestCase
    include ActiveJobExpectationTests
  end

  class TestActiveJobExpectationInCustomTestCase < ActiveSupport::TestCase
    include Minitest::Rails::Expectations::ActiveJob
    include ActiveJobExpectationTests
  end
end
