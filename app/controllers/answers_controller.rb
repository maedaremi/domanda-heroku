class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end
  
  def create
    @answer = current_user.answers.new(answer_params)
    
    if @answer.save
      redirect_to question_path(@answer.question_id), success: '回答を投稿しました'
    else
      flash.now[:danger] = '入力内容を確認していください'
      render :new
    end
  end
  
  def destroy
    answer = Answer.find(params[:id])
    #byebug
    if answer.destroy
      redirect_to question_path(answer.question_id), success: '削除しました'
    else
      flash.now[:danger] = '削除できませんでした'
      render :new
    end
  end

  
  private
  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :answer)
  end
end
