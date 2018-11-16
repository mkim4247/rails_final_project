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
    Follow.all.select do |follow| follow.follower == self
    end.collect do |follow|
      follow.following.posts.last
    end
  end

  def get_following(current_user)
    Follow.all.find do |follow|
      follow.user_id == current_user.id
      follow.following_id == self.id
    end
  end

  def self.search(search)
    if search
      if User.all.any? {|user| user.username == search || user.name == search}
        User.all.select {|user| (user.username == search || user.name == search)}
      end
    end
  end

  def most_commented_post
    self.posts.max_by {|post| post.comments.count}
  end

  def most_liked_post
    self.posts.max_by {|post| post.likes.count }
  end

  def most_saved_post
    self.posts.max_by {|post| post.lists.count}
  end

  def number_of_following
    self.following.count
  end

  def number_of_followers
    Follow.all.select do |follow|
      follow.following == self
    end.count
  end

  def most_recent_likes
    Like.all.select do |like|
      like.post.user == self
    end.sort_by do |like|
      like.created_at
    end.last(5)
  end

  def most_recent_comments
    Comment.all.select do |comment|
      comment.post.user == self
    end.sort_by do |comment|
      comment.created_at
    end.last(5)
  end

  def most_recent_followers
    Follow.all.select do |follow|
      follow.following == self
    end.sort_by do |follow|
      follow.created_at
    end.last(5)
  end

end
