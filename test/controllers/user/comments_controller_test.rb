require 'test_helper'

class User::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_comments_create_url
    assert_response :success
  end

  test "should get new" do
    get user_comments_new_url
    assert_response :success
  end

end
