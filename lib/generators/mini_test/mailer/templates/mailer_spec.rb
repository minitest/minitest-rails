require "minitest_helper"

describe <%= class_name %>Mailer do
<% actions.each do |action| -%>
  it "<%= action %>"
    mail = <%= class_name %>.<%= action %>
    mail.subject.must_equal <%= action.to_s.humanize.inspect %>
    mail.to.must_equal ["to@example.org"]
    mail.from.must_equal ["from@example.com"]
    mail.body.encoded.must_match "Hi"
  end

<% end -%>
<% if actions.blank? -%>
  it "must be a real test"
    flunk "Need real tests"
  end
<% end -%>
end
