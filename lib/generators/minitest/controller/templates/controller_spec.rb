require "test_helper"

<% module_namespacing do -%>
describe <%= class_name %>Controller do
<% if actions.empty? -%>
  it "must be a real test" do
    flunk "Need real tests"
  end
<% else -%>
<% actions.each do |action| -%>
  it "should get <%= action %>" do
    get :<%= action %>
    assert_response :success
  end

<% end -%>
<% end -%>
end
<% end -%>