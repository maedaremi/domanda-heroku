class FavoritesController < ApplicationController
  
  def index
    @favorite_answers = current_user.favorite_answers
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.answer_id = params[:answer_id]
    favorite.question_id = params[:question_id]
   # byebug
    
    if favorite.save
      
      redirect_to question_path(favorite.question_id), success: 'いいねしました'
    else
      redirect_to question_path(favorite.question_id), danger: 'いいねできませんでした'
    end
  end
  
  def destroy
    favorite = Favorite.find_by(answer_id: params[:answer_id], user_id: current_user.id)
    if favorite.destroy
      redirect_to question_path(favorite.question_id), success: 'いいねを解除しました'
    else
      redirect_to question_path(favorite.question_id), danger: '解除できませんでした'
    end
  end
end
