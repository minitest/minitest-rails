require "test_helper"

<% module_namespacing do -%>
class <%= class_name %>HelperTest < ActionView::TestCase

  def test_sanity
    assert true
  end

end
<% end -%>
