require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
 
  def user
    @user = "Ruby on Rails Tutorial Sample App"
  end
  test "should get index" do
    get users_index_path
    assert_response :success
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should get edit" do
    get users_edit_path(@user.id)
    assert_response :success
  end

  test "should get show" do
    get user_path(@user.id)
    assert_response :success
  end

end
