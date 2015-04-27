require "test_helper"

<% module_namespacing do -%>
describe <%= class_name %> do
  let(:<%= file_name %>) { <%= class_name %>.new }

  it "must be valid" do
    value(<%= file_name %>).must_be :valid?
  end
end
<% end -%>
