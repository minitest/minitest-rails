require "minitest_helper"

describe <%= class_name %> do

  subject { <%= class_name %>.new }

  # fixtures :all

  before do
    @<%= file_name %> = <%= class_name %>.new
  end

  it "must be valid" do
    @<%= file_name %>.valid?.must_equal true
  end

  it "must be a real test" do
    flunk "Need real tests"
  end

  # describe "when doing its thing" do
  #   it "must be interesting" do
  #     @<%= file_name %>.blow_minds!
  #     @<%= file_name %>.interesting?.must_equal true
  #   end
  # end

end
