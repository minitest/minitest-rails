require "test_helper"

<% module_namespacing do -%>
describe <%= class_name %> do
<% actions.each do |action| -%>
  it "<%= action %>" do
    mail = <%= class_name %>.<%= action %>
    value(mail.subject).must_equal <%= action.to_s.humanize.inspect %>
    value(mail.to).must_equal ["to@example.org"]
    value(mail.from).must_equal ["from@example.com"]
    value(mail.body.encoded).must_match "Hi"
  end
<% end -%>
<% if actions.blank? -%>
  it "must be a real test" do
    flunk "Need real tests"
  end
<% end -%>
end
<% end -%>
