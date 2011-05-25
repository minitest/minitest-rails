require 'test_helper'

<% module_namespacing do -%>
class <%= class_name %>ObserverTest < MiniTest::Unit::TestCase
  # load_code_to_test_observer

  # def test_truth
  #   assert true
  # end
end
<% end -%>
