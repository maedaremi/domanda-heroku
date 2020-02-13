class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to root_path, success: '登録が完了しました'
      else
        flash.now[:danger] = "登録に失敗しました"
        render :new
      end
  end
  
  def show
    @user = User.find(params[:id])
    #@request = Request.find(params[:user][:id])
    #@user = User.find(params[:user][:id])
  end
  
  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
