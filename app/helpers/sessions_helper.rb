module SessionsHelper
  def log_in(user)
    session[:id] = user.id
  end
  def current_user
    if (user_id = session[:id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
   def logged_in?
    !current_user.nil?
   end
  def remember(user)
    user.remember
    cookies.permanent.signed[:id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  # 現在ログインしているユーザーを返す (いる場合)
  def current_user
    if session[:id]
      @current_user ||= User.find_by(id: session[:id])
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
   # 永続的セッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # 現在のユーザーをログアウトする
  def log_out
    forget(current_user)
    session.delete(:id)
    @current_user = nil
  end

end
