class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :lists, dependent: :destroy

  has_many :follows, dependent: :destroy
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower


  has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  has_one_attached :avatar

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

# grabs the most recent posts
  def feed_posts
    self.following.collect {|user| user.posts.last}
  end

  def get_following(current_user)
    Follow.all.find do |follow|
      follow.user_id == current_user.id
      follow.following_id == self.id
    end
  end

end
