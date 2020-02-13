class RequestsController < ApplicationController
 
 def index
  @request_questions = current_user.request_questions
 end
 
 def new
   @user = User.find(params[:user_id])
 end
 
 def create
   @request = Request.new
   @request.question_id = params[:question_id]
   @request.user_id = params[:user_id]
   
    if @request.save
     redirect_to user_path(@request.user_id), success: 'リクエストに成功しました'
    else
     flash.now[:danger] = 'リクエストに失敗しました'
     render :new
    end
 end
end
