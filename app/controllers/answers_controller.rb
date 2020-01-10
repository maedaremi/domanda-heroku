class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end
  
  def create
    @answer = current_user.answers.new(answer_params)
    
    if @answer.save
      redirect_to question_path(@answer.question_id), success: '回答を投稿しました'
    else
      flash.now[:danger] = '入力内容を確認していください'
      render :new
     #byebug
    end
  end
  
  private
  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :answer)
  end
end
