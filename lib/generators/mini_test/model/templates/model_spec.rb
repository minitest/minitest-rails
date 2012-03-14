require "minitest_helper"

<% module_namespacing do -%>
describe <%= class_name %> do
  # fixtures :all

  before do
    @<%= file_name %> = <%= class_name %>.new
  end

  it "must be valid" do
    @<%= file_name %>.must_be :valid?
  end

  it "must be a real test" do
    flunk "Need real tests"
  end
end
<% end -%>
