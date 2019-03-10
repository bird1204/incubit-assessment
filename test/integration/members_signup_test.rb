require 'test_helper'

class MembersSignupTest < ActionDispatch::IntegrationTest
  test "success signup" do
    get new_resgistration_path
    assert_difference 'Member.count', 1 do
      post resgistration_index_path, params: { 
        member: { 
           email: "good@112exam.com",
           password:              "1111111111",
           password_confirmation: "1111111111" 
        } 
      }
    end
    follow_redirect!
    assert sign_in?
    assert_not flash.empty?
    assert flash[:success] == 'Welcome to join us !!!'
  end

  test "invalid signup information because of password" do
    get new_resgistration_path
    assert_no_difference 'Member.count' do
      post resgistration_index_path, params: { 
        member: { 
           email: "invalid@invalid",
           password:              "111",
           password_confirmation: "222" 
        } 
      }
    end
    get new_resgistration_path
    assert_not flash.empty?
  end

  test "invalid signup information because of invalid email" do
    get new_resgistration_path
    assert_no_difference 'Member.count' do
      post resgistration_index_path, params: { 
        member: { 
           email: "invalidf@",
           password:              "111",
           password_confirmation: "111" 
        } 
      }
    end
    get new_resgistration_path
    assert_not flash.empty?
  end
end
