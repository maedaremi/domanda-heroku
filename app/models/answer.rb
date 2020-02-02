class Answer < ApplicationRecord
  
  belongs_to :user
  belongs_to :question
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: 'user', dependent: :destroy
end
