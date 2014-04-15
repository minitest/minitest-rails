require "test_helper"

<% module_namespacing do -%>
describe <%= class_name %>Helper do

  it "must be a real test" do
    flunk "Need real tests"
  end

end
<% end -%>
