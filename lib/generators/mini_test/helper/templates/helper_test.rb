require "minitest_helper"

<% module_namespacing do -%>
class <%= class_name %>HelperTest < MiniTest::Rails::Helper
  def test_sanity
    flunk "Need real tests"
  end
end
<% end -%>
