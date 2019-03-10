# require 'test_helper'

class PasswordMailerTest < ActionMailer::TestCase
  test "forget" do
    member = members(:weiyi)
    mail = PasswordMailer.forget member
    assert_equal "Account Recovery", mail.subject
    assert_equal [member.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match 'Hi, click the link to recovery your password', mail.body.encoded
  end
end
