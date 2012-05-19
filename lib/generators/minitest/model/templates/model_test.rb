require "minitest_helper"

<% module_namespacing do -%>
class <%= class_name %>Test < Minitest::Rails::Model

  def test_sanity
    flunk "Need real tests"
  end

end
<% end -%>
