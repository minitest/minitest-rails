require "minitest_helper"

<% module_namespacing do -%>
class <%= class_name %>ControllerTest < MiniTest::Rails::Controller
  #fixtures :all

<% if actions.empty? -%>
  def test_sanity
    flunk "Need real tests"
  end
<% else -%>
<% actions.each do |action| -%>
  def test_<%= action %>
    get :<%= action %>
    assert_response :success
  end

<% end -%>
<% end -%>
end
<% end -%>
