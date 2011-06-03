require "minitest_helper"

class <%= class_name %>ControllerTest < MiniTest::Rails::Controller
  before do
    @controller = <%= class_name %>Controller.new
  end

  it "must be a real test" do
    flunk "Need real tests"
  end
end
