require "test_helper"
require "<%= generator_path %>"

<% module_namespacing do -%>
class <%= class_name %>GeneratorTest < Rails::Generators::TestCase
  tests <%= class_name %>Generator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # def test_generator_runs
  #   # No error raised? It passes.
  #   run_generator ["arguments"]
  # end
end
<% end -%>