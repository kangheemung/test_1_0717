require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
  

    test "login with valid information" do
    get sessions_new_path
    post sessions_create_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]",sessions_new_path, count: 0
    assert_select "a[href=?]", sessions_destroy_path
    assert_select "a[href=?]", user_path(@user)
    delete sessions_destroy_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # 2番目のウィンドウでログアウトをクリックするユーザーをシミュレートする
    delete sessions_destroy_path
    follow_redirect!
    assert_select "a[href=?]", sessions_new_path
    assert_select "a[href=?]", sessions_destroy_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
  
  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies['remember_token']
  end

  test "login without remembering" do
    # クッキーを保存してログイン
    log_in_as(@user, remember_me: '1')
    delete sessions_destroy_path
    # クッキーを削除してログイン
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end 

end
