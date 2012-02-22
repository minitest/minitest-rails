require "minitest_helper"

<% module_namespacing do -%>
describe <%= class_name %>Controller do
  # fixtures :all

<% if actions.empty? -%>
  it "must be a real test" do
    flunk "Need real tests"
  end
<% else -%>
<% actions.each do |action| -%>
  describe "<%= action %> action" do
    it "respond with success" do
      get :<%= action %>
      must_respond_with :success
    end
  end
<% end -%>
<% end -%>
end
<% end -%>

