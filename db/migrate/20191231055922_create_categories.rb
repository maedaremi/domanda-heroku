class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category

      t.timestamps
      add_reference :categories, :question_category
    end
  end
end
