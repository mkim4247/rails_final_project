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



end
