require "minitest_helper"

<% module_namespacing do -%>
class <%= class_name %>Test < MiniTest::Rails::Model
  #fixtures :all

  def test_sanity
    flunk "Need real tests"
  end
end
<% end -%>
