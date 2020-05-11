require 'test_helper'

class User::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_users_show_url
    assert_response :success
  end

  test "should get new" do
    get user_users_new_url
    assert_response :success
  end

  test "should get destroy" do
    get user_users_destroy_url
    assert_response :success
  end

  test "should get cancel" do
    get user_users_cancel_url
    assert_response :success
  end

end
