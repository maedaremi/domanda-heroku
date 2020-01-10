class Question < ApplicationRecord
  validates :user_id, presence: true
  validates :question, presence: true
  #validates :category_id, presence: true
  
  belongs_to :user
  belongs_to :category
  has_many :answers
  #has_many :question_categories
  #has_many :categories, through: :question_categories
  #accepts_nested_attributes_for :question_categories
end
