require 'test_helper'

<% module_namespacing do -%>
class <%= class_name %>Test < MiniTest::Unit::TestCase
  testing_model

  # def test_truth
  #   assert true
  # end
end
<% end -%>
