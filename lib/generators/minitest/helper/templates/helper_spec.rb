require "minitest_helper"

describe <%= class_name %>Helper do
  before do
    @helper= <%= class_name %>Helper.new
  end

  it "must be valid" do
    @helper.valid?.must_equal true
  end
end
