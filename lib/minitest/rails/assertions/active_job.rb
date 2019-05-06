class ActiveJob::TestCase
  # Asserts that the number of enqueued jobs matches the given number.
  #
  #   def test_jobs
  #     assert_enqueued_jobs 0
  #     HelloJob.perform_later('david')
  #     assert_enqueued_jobs 1
  #     HelloJob.perform_later('abdelkader')
  #     assert_enqueued_jobs 2
  #   end
  #
  # If a block is passed, that block should cause the specified number of
  # jobs to be enqueued.
  #
  #   def test_jobs_again
  #     assert_enqueued_jobs 1 do
  #       HelloJob.perform_later('cristian')
  #     end
  #
  #     assert_enqueued_jobs 2 do
  #       HelloJob.perform_later('aaron')
  #       HelloJob.perform_later('rafael')
  #     end
  #   end
  #
  # See also Minitest::Rails::Expectations#must_enqueue_jobs
  #
  # :method: assert_enqueued_jobs
  # :call-seq: assert_enqueued_jobs(number)

  ##
  # Asserts that no jobs have been enqueued.
  #
  #   def test_jobs
  #     refute_enqueued_jobs
  #     HelloJob.perform_later('jeremy')
  #     assert_enqueued_jobs 1
  #   end
  #
  # If a block is passed, that block should not cause any job to be enqueued.
  #
  #   def test_jobs_again
  #     refute_enqueued_jobs do
  #       # No job should be enqueued from this block
  #     end
  #   end
  #
  # Note: This assertion is simply a shortcut for:
  #
  #   assert_enqueued_jobs 0, &block
  #
  # See also Minitest::Rails::Expectations#wont_enqueue_jobs
  #
  # :args: number
  alias refute_enqueued_jobs assert_no_enqueued_jobs

  ##
  # Asserts that the number of performed jobs matches the given number.
  # If no block is passed, <tt>perform_enqueued_jobs</tt>d
  # must be called around the job call.
  #
  #   def test_jobs
  #     assert_performed_jobs 0
  #
  #     perform_enqueued_jobs do
  #       HelloJob.perform_later('xavier')
  #     end
  #     assert_performed_jobs 1
  #
  #     perform_enqueued_jobs do
  #       HelloJob.perform_later('yves')
  #       assert_performed_jobs 2
  #     end
  #   end
  #
  # If a block is passed, that block should cause the specified number of
  # jobs to be performed.
  #
  #   def test_jobs_again
  #     assert_performed_jobs 1 do
  #       HelloJob.perform_later('robin')
  #     end
  #
  #     assert_performed_jobs 2 do
  #       HelloJob.perform_later('carlos')
  #       HelloJob.perform_later('sean')
  #     end
  #   end
  #
  # See also Minitest::Rails::Expectations#must_perform_jobs
  #
  # :method: assert_performed_jobs
  # :call-seq: assert_performed_jobs(number)

  ##
  # Asserts that no jobs have been performed.
  #
  #   def test_jobs
  #     refute_performed_jobs
  #
  #     perform_enqueued_jobs do
  #       HelloJob.perform_later('matthew')
  #       assert_performed_jobs 1
  #     end
  #   end
  #
  # If a block is passed, that block should not cause any job to be performed.
  #
  #   def test_jobs_again
  #     refute_performed_jobs do
  #       # No job should be performed from this block
  #     end
  #   end
  #
  # Note: This assertion is simply a shortcut for:
  #
  #   assert_performed_jobs 0, &block
  #
  # See also Minitest::Rails::Expectations#wont_perform_jobs
  #
  # :args: number
  alias refute_performed_jobs assert_no_performed_jobs

  ##
  # Asserts that the job passed in the block has been enqueued with the given arguments.
  #
  #   def test_assert_enqueued_with
  #     assert_enqueued_with(job: MyJob, args: [1,2,3], queue: 'low') do
  #       MyJob.perform_later(1,2,3)
  #     end
  #   end
  #
  # See also Minitest::Rails::Expectations#must_enqueue_with
  #
  # :method: assert_enqueued_with
  # :call-seq: assert_enqueued_with(args)

  ##
  # Asserts that the job passed in the block has been performed with the given arguments.
  #
  #   def test_assert_performed_with
  #     assert_performed_with(job: MyJob, args: [1,2,3], queue: 'high') do
  #       MyJob.perform_later(1,2,3)
  #     end
  #   end
  #
  # See also Minitest::Rails::Expectations#must_perform_with
  #
  # :method: assert_performed_with
  # :call-seq: assert_performed_with(args)
end
