class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :saves

  validates :title, presence: true
  validates :content, presence: true

  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :likes

  def format_time
    self.created_at.strftime("%d %b %Y")
  end
end
