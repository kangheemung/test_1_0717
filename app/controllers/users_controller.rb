class UsersController < ApplicationController
  def index
       @users = User.all
  end

  def new
    @user=User.new
  end

  def edit
      @user=User.find_by(id: params[:id])
  end

  def show
    @user=User.find_by(id: params[:id])
  end
  def create
       user = User.new(user_params)
      if user.save
        session[:id]=user.id
       
          flash[:notice]="ユーザー登録が完了しました"
          redirect_to user_path(user.id)
      else
        render :new
      end
    
   
  end

  def update
    @user=User.find_by(id:params[:id])
    if @user.update(user_params)
      flash[:notice ]="プランナー情報を更新しました。"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
    
  
  end

  def destroy
 
  end
   private
    def user_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
