class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end
 
  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    
    if @question.save
      redirect_to questions_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end
  
  def show
    @question = Question.find(params[:id])
  end
  
  def destroy
    @question = Question.find(params[:id])
    
    if @question.destroy
     
      redirect_to questions_path, success: '削除しました'
    else
      flash.now[:danger] = '削除できませんでした'
      render :new
    end
  end
  
  private 
  def question_params
    params.require(:question).permit(:question, :category_id, :category)
  end
end
