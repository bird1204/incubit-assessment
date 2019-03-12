require 'test_helper'

# TO-DO
# test case with recapcha

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @member = Member.create(email: 'bird1204@gmail.com', password: '11111111', username: 'bird.chiu')
  end

  test "password resets" do
    # Invalid email
    assert_raise(ActiveRecord::RecordNotFound) do
      get password_forget_members_path, params: {session: {email: ""}}
    end

    # Valid email
    get password_forget_members_path, params: {session: {email: @member.email}}
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to password_edit_members_path


    # Wrong email
    assert_raise(ActiveRecord::RecordNotFound) do
      put password_members_path, params: {session: {token: @member.reload.reset_password_token, email: ""}}
    end

    # Right email, wrong token
    put password_members_path, params: {session: {token: 'reset_password_token', email: @member.email, password: '22222222'}}
    assert_not flash.empty?
    assert_redirected_to password_edit_members_path

    # Valid password & confirmation
    patch password_members_path,
          params: { email: @member.email,
                    token: @member.reset_password_token,
                    password: "111111112222",
                    password_confirmation: "111111112222"
                  }
    assert_not flash.empty?
  end
end
