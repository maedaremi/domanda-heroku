class AddQuestionIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :question_id, :integer
  end
end
