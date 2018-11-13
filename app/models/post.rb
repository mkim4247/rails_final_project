class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :content, presence: true
  accepts_nested_attributes_for :comments

  def format_time
    self.created_at.strftime("%d %b %Y")
  end
end
