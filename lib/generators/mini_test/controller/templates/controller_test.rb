require "test_helper"

<% module_namespacing do -%>
class <%= class_name %>ControllerTest < ActionController::TestCase
<% if actions.empty? -%>
  test "sanity" do
    flunk "Need real tests"
  end
<% else -%>
<% actions.each do |action| -%>
  test "should get <%= action %>" do
    get :<%= action %>
    assert_response :success
  end

<% end -%>
<% end -%>
end
<% end -%>
