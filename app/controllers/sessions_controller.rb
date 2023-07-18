class SessionsController < ApplicationController
  def new
  
  end
  def create
    @user=User.find_by(email: params[:session][:email].downcase)
    if @user&&@user.authenticate(params[:session][:password])
      p"================="
      p params
     p"================="
     session[:id]=@user.id
     redirect_to user_path(@user.id)
    else
     render :new
    end
  end
end
