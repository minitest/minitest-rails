require "helper"

if defined? ActiveJob # Rails 4.2 and later.
  class UserInviteJob < ActiveJob::Base; end
  class InviteUser < ActiveJob::Base; end

  class TestActiveJobSpecType < Minitest::Test
    def assert_job actual
      assert_equal ActiveJob::TestCase, actual
    end

    def refute_job actual
      refute_equal ActiveJob::TestCase, actual
    end

    def test_spec_type_resolves_for_class_constants
      assert_job Minitest::Spec.spec_type(UserInviteJob)
      assert_job Minitest::Spec.spec_type(InviteUser)
    end

    def test_spec_type_resolves_for_matching_string
      assert_job Minitest::Spec.spec_type("UserInviteJob")
      assert_job Minitest::Spec.spec_type("UserInviteJobTest")
      assert_job Minitest::Spec.spec_type("User Invite Job Test")
      # And is not case sensitive
      assert_job Minitest::Spec.spec_type("userinvitejob")
      assert_job Minitest::Spec.spec_type("userinvitejobtest")
      assert_job Minitest::Spec.spec_type("user invite job test")
    end

    def test_spec_type_wont_match_non_space_characters
      refute_job Minitest::Spec.spec_type("User Invite Job\tTest")
      refute_job Minitest::Spec.spec_type("User Invite Job\rTest")
      refute_job Minitest::Spec.spec_type("User Invite Job\nTest")
      refute_job Minitest::Spec.spec_type("User Invite Job\fTest")
      refute_job Minitest::Spec.spec_type("User Invite JobXTest")
    end

    def test_spec_type_doesnt_resolve_random_strings
      refute_job Minitest::Spec.spec_type("Unmatched String")
    end

    def test_spec_type_resolves_for_additional_desc_job
      assert_job Minitest::Spec.spec_type("Unmatched String", :job)
      assert_job Minitest::Spec.spec_type("Unmatched String", :job, :other)
      assert_job Minitest::Spec.spec_type("Unmatched String", :other, :job)
    end
  end
end
