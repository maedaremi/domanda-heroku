class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /[^\s]@[^\s]\.[^\s]/ }
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\Z/i }
  validates :password_confirmation, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\Z/i}
  
  has_secure_password
  
  has_many :questions
  has_many :answers
  has_many :active_relationships, class_name: "Relationship",
                    foreign_key:"follower_id",
                    dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                    foreign_key:"followed_id",
                    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships,source: :follower
  
  
  
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
  
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def following?(other_user)
    following.include?(other_user)
  end
  
end
