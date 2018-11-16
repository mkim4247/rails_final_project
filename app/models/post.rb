class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_one_attached :avatar

  geocoded_by :get_address
  after_validation :geocode

  validates :title, presence: true
  validates :content, presence: true

  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :likes

  def format_time
    self.created_at.strftime("%d %b %Y")
  end

  def get_address
    self.address
  end

  def self.search(search)
    if search != ""
      if Post.all.any? do |post|
        post.title.include?(search) || post.content.include?(search) || post.user.username == search
        end
        Post.all.select {|post| post.title.include?(search) || post.content.include?(search) || post.user.username == search}
      end
    end
  end

  def self.get_most_commented
    Post.all.max_by do |post|
      post.comments.count
    end
  end

  def self.get_most_recent
    Post.all.sort_by do |post|
      post.created_at
    end.last
  end

  def self.get_random
    Post.all.sample
  end

  def self.get_most_saved
    Post.all.max_by do |post|
      post.lists.count
    end
  end

  def self.get_most_liked
    Post.all.max_by do |post|
      post.likes.count 
    end
  end


end
