class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :lists
  has_many :follows
  has_one_attached :avatar

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password
end
