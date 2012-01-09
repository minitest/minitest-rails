require "minitest_helper"

<% module_namespacing do -%>
class <%= class_name %>IntegrationTest < MiniTest::Rails::Integration
  # fixtures :all

  # Replace this with your real tests.
  def test_sanity
    flunk "Need real tests"
  end
<% end -%>

