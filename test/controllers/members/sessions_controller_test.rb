require 'test_helper'

class Members::SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get new_session_path
    assert_response :success
  end

end
