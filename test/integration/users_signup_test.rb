require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_create_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_template 'users/new'
     assert_select 'div#<SCSS id for error explanation>'
    assert_select 'div.<SCSS class for field with error>'
  end
end
