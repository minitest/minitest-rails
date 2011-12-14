require "minitest_helper"

describe <%= class_name %>Controller do

  subject { <%= class_name %>Controller }

  # fixtures :all

  before do
    @controller = <%= class_name %>Controller.new
  end

  it "must be a real test" do
    flunk "Need real tests"
  end

end
