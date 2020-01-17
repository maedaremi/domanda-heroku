class UsersController < ApplicationController
  before_action :logged_in_user ,only:[:following,:followers]
  
  
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
  end
  
  #def following
    #@title = "Following"
    #@user = User.find(params[:id])
    #@users = @user.following.paginate(page: params[:page])
    #render 'show_follow'
  #end
  
  #def followers
    #@title = "Followers"
    #@user = User.find(params[:id])
    #@users = @user.followers.paginate(page: params[:page])
    #render 'show_follow'
  #end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
