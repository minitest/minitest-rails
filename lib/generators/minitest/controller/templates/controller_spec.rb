require "minitest_helper"

describe <%= class_name %>Controller do
  before do
    @controller = <%= class_name %>Controller.new
  end

  it "must be valid" do
    @controller.valid?.must_equal true
  end
end
