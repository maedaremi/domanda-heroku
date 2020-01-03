class Category < ApplicationRecord
  validates :category, presence: true
  
  has_many :question_categories
  has_many :questions, through: :question_categories
  #accepts_nested_attributes_for :question_category
end
