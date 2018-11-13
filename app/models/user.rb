class User < ApplicationRecord
  has_many :posts
  has_many :comments
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
