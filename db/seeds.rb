# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 
# Comment.destroy_all
# Follow.destroy_all
# Like.destroy_all
# List.destroy_all
# Post.destroy_all
# User.destroy_all

#User Seeds
  #missing AVATAR AND BIO
ana = User.create(name: "Ana", username: "banAna", email: "ana@gmail.com", password: "123", password_confirmation: "123")
mike = User.create(name: "Mike", username: "kimbo", email: "m.kim4247@gmail.com", password: "123", password_confirmation: "123")
robin = User.create(name: "Robin", username: "rtram", email: "robin@gmail.com", password: "123", password_confirmation: "123")
caroline = User.create(name: "Caroline", username: "carocaro", email: "caroline@gmail.com", password: "123", password_confirmation: "123")
iman = User.create(name: "Iman", username: "imanji", email: "iman@gmail.com", password: "123", password_confirmation: "123")

#Post Seeds
  #missing PHOTO_URL, ADDRESS
i = 0
5.times do
  Post.create(title: "Post #{i}", content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: i)
  i += 1
end

#Comment Seeds
n = 0
5.times do
  Comment.create(content: "I'm just a comment that's meant to fill up space....", user_id: n, post_id: n)
  n += 1
end

#Follow Seeds
follow1 = Follow.create(user_id: 1, following_id: 2)
follow2 = Follow.create(user_id: 1, following_id: 3)
follow3 = Follow.create(user_id: 1, following_id: 4)
follow4 = Follow.create(user_id: 1, following_id: 5)
follow5 = Follow.create(user_id: 2, following_id: 1)
follow6 = Follow.create(user_id: 2, following_id: 3)
follow7 = Follow.create(user_id: 2, following_id: 4)
follow8 = Follow.create(user_id: 2, following_id: 5)

#Like Seeds
like1 = Like.create(user_id: 1, post_id: 2)
like1 = Like.create(user_id: 1, post_id: 3)
like1 = Like.create(user_id: 1, post_id: 4)
like1 = Like.create(user_id: 1, post_id: 5)
like1 = Like.create(user_id: 2, post_id: 1)

#List Seeds
list1 = List.create(user_id: 2, post_id: 1)
list1 = List.create(user_id: 2, post_id: 3)
list1 = List.create(user_id: 2, post_id: 4)
list1 = List.create(user_id: 2, post_id: 5)
list1 = List.create(user_id: 1, post_id: 2)
