require "test_helper"
require "<%= generator_path %>"

<% module_namespacing do -%>
describe <%= class_name %>Generator do
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # it "generator runs without errors" do
  #   # No error raised? It passes.
  #   run_generator ["arguments"]
  # end
end
<% end -%>