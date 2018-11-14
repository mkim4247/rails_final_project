class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :lists

  has_many :follows
  has_many :follower_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  has_one_attached :avatar

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  def feed_posts
    
  end

end
