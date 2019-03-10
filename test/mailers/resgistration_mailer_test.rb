# require 'test_helper'

class ResgistrationMailerTest < ActionMailer::TestCase
  test "successs_msg" do
    member = members(:weiyi)
    mail = ResgistrationMailer.successs_msg member
    assert_equal "Resgistration Result", mail.subject
    assert_equal [member.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi, #{member.email}. Welcome to join us.", mail.body.encoded
  end

end
