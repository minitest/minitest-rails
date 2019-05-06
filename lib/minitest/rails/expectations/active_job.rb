require "active_support/concern"

module Minitest
  module Rails
    module Expectations
      # This exists as a module to allow easy mixing into classes
      # other than ActiveJob::TestCase where you might want to do
      # job testing e.g. in an Active Record model which triggers
      # jobs in a callback.
      module ActiveJob
        ##
        # Expects that the number of enqueued jobs matches the given number.
        #
        #   def test_jobs
        #     must_enqueue_jobs 0
        #     HelloJob.perform_later('david')
        #     must_enqueue_jobs 1
        #     HelloJob.perform_later('abdelkader')
        #     must_enqueue_jobs 2
        #   end
        #
        # If a block is passed, that block should cause the specified number of
        # jobs to be enqueued.
        #
        #   def test_jobs_again
        #     must_enqueue_jobs 1 do
        #       HelloJob.perform_later('cristian')
        #     end
        #
        #     must_enqueue_jobs 2 do
        #       HelloJob.perform_later('aaron')
        #       HelloJob.perform_later('rafael')
        #     end
        #   end
        #
        # See also ActiveJob::TestCase#assert_enqueued_jobs
        #
        # :method: must_enqueue_jobs
        # :call-seq: must_enqueue_jobs(number)

        ##
        # Expects that no jobs have been enqueued.
        #
        #   def test_jobs
        #     wont_enqueue_jobs
        #     HelloJob.perform_later('jeremy')
        #     must_enqueue_jobs 1
        #   end
        #
        # If a block is passed, that block should not cause any job to be enqueued.
        #
        #   def test_jobs_again
        #     wont_enqueue_jobs do
        #       # No job should be enqueued from this block
        #     end
        #   end
        #
        # Note: This expectation is simply a shortcut for:
        #
        #   must_enqueue_jobs 0, &block
        #
        # See also ActiveJob::TestCase#refute_enqueued_jobs
        #
        # :method: wont_enqueue_jobs
        # :call-seq: wont_enqueue_jobs(number)

        ##
        # Expects that the number of performed jobs matches the given number.
        # If no block is passed, <tt>perform_enqueued_jobs</tt>d
        # must be called around the job call.
        #
        #   def test_jobs
        #     must_perform_jobs 0
        #
        #     perform_enqueued_jobs do
        #       HelloJob.perform_later('xavier')
        #     end
        #     must_perform_jobs 1
        #
        #     perform_enqueued_jobs do
        #       HelloJob.perform_later('yves')
        #       must_perform_jobs 2
        #     end
        #   end
        #
        # If a block is passed, that block should cause the specified number of
        # jobs to be performed.
        #
        #   def test_jobs_again
        #     must_perform_jobs 1 do
        #       HelloJob.perform_later('robin')
        #     end
        #
        #     must_perform_jobs 2 do
        #       HelloJob.perform_later('carlos')
        #       HelloJob.perform_later('sean')
        #     end
        #   end
        #
        # See also ActiveJob::TestCase#assert_performed_jobs
        #
        # :method: must_perform_jobs
        # :call-seq: must_perform_jobs(number)

        ##
        # Expects that no jobs have been performed.
        #
        #   def test_jobs
        #     wont_perform_jobs
        #
        #     perform_enqueued_jobs do
        #       HelloJob.perform_later('matthew')
        #       must_perform_jobs 1
        #     end
        #   end
        #
        # If a block is passed, that block should not cause any job to be performed.
        #
        #   def test_jobs_again
        #     wont_perform_jobs do
        #       # No job should be performed from this block
        #     end
        #   end
        #
        # Note: This assertion is simply a shortcut for:
        #
        #   must_perform_jobs 0, &block
        #
        # See also ActiveJob::TestCase#refute_performed_jobs
        #
        # :method: wont_perform_jobs
        # :call-seq: wont_perform_jobs(number)

        ##
        # Expects that the job passed in the block has been enqueued with the given arguments.
        #
        #   def test_must_enqueue_with
        #     must_enqueue_with(job: MyJob, args: [1,2,3], queue: 'low') do
        #       MyJob.perform_later(1,2,3)
        #     end
        #   end
        #
        # See also Minitest::Rails::Expectations#assert_enqueued_with
        #
        # :method: must_enqueue_with
        # :call-seq: must_enqueue_with(args)

        ##
        # Expects that the job passed in the block has been performed with the given arguments.
        #
        #   def test_must_perform_with
        #     must_perform_with(job: MyJob, args: [1,2,3], queue: 'high') do
        #       MyJob.perform_later(1,2,3)
        #     end
        #   end
        #
        # See also Minitest::Rails::Expectations#assert_performed_with
        #
        # :method: must_perform_with
        # :call-seq: must_perform_with(args)

        extend ::ActiveSupport::Concern
        include ::ActiveJob::TestHelper

        included do
          alias_method :must_enqueue_jobs, :assert_enqueued_jobs
          alias_method :must_perform_jobs, :assert_performed_jobs
          alias_method :wont_enqueue_jobs, :assert_no_enqueued_jobs
          alias_method :wont_perform_jobs, :assert_no_performed_jobs
          alias_method :must_enqueue_with, :assert_enqueued_with
          alias_method :must_perform_with, :assert_performed_with
        end
      end
    end
  end
end

unless ENV["MT_NO_EXPECTATIONS"]
  class ActiveJob::TestCase # :nodoc:
    include Minitest::Rails::Expectations::ActiveJob
  end
end
