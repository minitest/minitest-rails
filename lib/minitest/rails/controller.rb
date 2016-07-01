##
# Include the expectation aliases to calls on AC::TC will work.
# Other assertions and expectations are already inherited.
# No need to provide docs, we don't want to advertise this support.
#

class ActionController::TestCase # :nodoc:
  alias :must_respond_with :assert_response
  alias :must_redirect_to :assert_redirected_to
  alias :must_render_template :assert_template
  alias :must_have_tag :assert_tag
  alias :wont_have_tag :assert_no_tag
  alias :must_select :assert_select
  alias :must_select_email :assert_select_email
  alias :must_select_encoded :assert_select_encoded
end
