require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get most" do
    get :most
    assert_response :success
  end

  test "should get recent" do
    get :recent
    assert_response :success
  end

end
