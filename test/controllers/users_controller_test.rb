require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
 
  def user
     
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end
  end
  test "should get index" do
    get users_index_path
    assert_response :success
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should get edit" do
    get users_edit_path(@user.id)
    assert_response :success
  end

  test "should get show" do
    get user_path(@user)
    assert_response :success
  end

end
