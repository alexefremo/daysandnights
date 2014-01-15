require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get content" do
    get :content
    assert_response :success
  end

  test "should get subscription" do
    get :subscription
    assert_response :success
  end

  test "should get manage" do
    get :manage
    assert_response :success
  end

end
