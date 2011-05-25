require 'test_helper'

<% module_namespacing do -%>
class <%= class_name %>Test < MiniTest::Unit::TestCase
  load_code_to_test_model

  # def test_truth
  #   assert true
  # end
end
<% end -%>
