require 'test_helper'

class User::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_home_index_url
    assert_response :success
  end

  test "should get show" do
    get user_home_show_url
    assert_response :success
  end

end
