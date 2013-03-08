require "test_helper"

<% module_namespacing do -%>
describe <%= class_name %> do
  before do
    @<%= file_name %> = <%= class_name %>.new
  end

  it "must be valid" do
    @<%= file_name %>.valid?.must_equal true
  end
end
<% end -%>
