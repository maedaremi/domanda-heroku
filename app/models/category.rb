class Category < ApplicationRecord
  
  has_many :questions
  #has_many :question_categories
  #has_many :questions, through: :question_categories
  #accepts_nested_attributes_for :question_category
end
