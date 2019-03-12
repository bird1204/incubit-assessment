require 'test_helper'

# TO-DO
# test case with recapcha

class MembersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @member = Member.create(email: "mem@example.com", password: 'password')
  end
  test "login with invalid email" do
    get new_session_path
    assert_template 'members/sessions/new'
    post session_index_path, params: { session: { email: "unexist@example.com", password: "" } }
    get new_session_path
    assert_not flash[:error].empty?
    assert flash[:error].match(/incorrect email or password/)
  end

  test "login with invalid password" do
    get new_session_path
    assert_template 'members/sessions/new'
    post session_index_path, params: { session: { email: @member.email, password: "" } }
    get new_session_path
    assert_not flash[:error].empty?
    assert flash[:error].match(/incorrect email or password/)
  end

  test "login with correct password" do
    get new_session_path
    assert_template 'members/sessions/new'
    post session_index_path, params: { session: { email: @member.email, password: @member.password } }
    follow_redirect!
    assert_not flash[:success].empty?
    assert sign_in?
    assert log_in_as(@member)
  end


end
