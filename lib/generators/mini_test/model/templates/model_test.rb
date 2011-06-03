require "minitest_helper"

<% module_namespacing do -%>
class <%= class_name %>Test < MiniTest::Rails::Model

  def test_truth
    assert true
  end

end
<% end -%>
