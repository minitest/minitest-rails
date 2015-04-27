require "test_helper"

# Add the following to your Rake file to test routes by default:
#   Rails::TestTask.new("test:routes" => "test:prepare") do |t|
#     t.pattern = "test/routes/**/*_test.rb"
#   end
#   Rake::Task["test:run"].enhance ["test:routes"]

describe "Route Integration Test" do
  it "route root" do
    must_route "/", controller: "home", action: "show"
  end
end
