require "test_helper"

<% module_namespacing do -%>
describe <%= class_name %>Controller do
<% if mountable_engine? -%>
  include Engine.routes.url_helpers

<% end -%>
<% if actions.empty? -%>
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
<% else -%>
<% actions.each do |action| -%>
  it "should get <%= action %>" do
    get <%= url_helper_prefix %>_<%= action %>_url
    value(response).must_be :success?
  end

<% end -%>
<% end -%>
end
<% end -%>
