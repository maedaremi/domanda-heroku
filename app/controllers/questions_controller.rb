class QuestionsController < ApplicationController
  def index
    @question = Question.all
    #@question_category = QuestionCategory.all
    #@question_category = QuestionCategory.new
  end
 
  def new
    @question = Question.new
    #@question_category = QuestionCategory.new
    @question.question_categories.build
    #@category = Category.new
  end

  def create
    @question = current_user.questions.new(question_params)
    byebug
    
    if @question.save
      redirect_to questions_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
    
     #@question_category = QuestionCategory.new(category_id: params[:question_category][:category_id])
     #@question_category.save
     #redirect_to question_path
  end
  
  private 
  def question_params
    params.require(:question).permit(:question, question_categories_attributes:[:category_id, :question_id])
  end
end
