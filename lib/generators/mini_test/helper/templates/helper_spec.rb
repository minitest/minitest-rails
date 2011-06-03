require "minitest_helper"

class <%= class_name %>HelperTest < MiniTest::Rails::Helper
  before do
    @helper= <%= class_name %>Helper.new
  end

  it "must be a real test" do
    flunk "Need real tests"
  end
end
