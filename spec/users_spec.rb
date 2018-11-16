require 'rails_helper'

RSpec.describe User do
  before do
    @ana = User.create(name: "Ana")
    @mike = User.create(name: "Mike")
    @post1 = @ana.posts.build(title: "Ana's first post")
    @post2 = @ana.posts.build(title: "Ana's second post")
    @post3 = @mike.posts.build(title: "Mike's post")
    @comment1 = @ana.posts.first.comments.build(content: "Great read!")
    @comment2 = @mike.posts.first.comments.build(content: "Meh")
    @comment3 = @mike.posts.first.comments.build(content: "Waste of time")
    2.times do @ana.posts.last.comments.build end
    2.times do @ana.following.build end
    3.times do @ana.posts.first.lists.build end
    5.times do @ana.posts.first.likes.build end
  end

  describe "most_commented_post" do
    it "returns the user's post with the most comments" do
      expect(@mike.most_commented_post).to eq(@post3)
    end
  end

  describe "most_commented_post" do
    it "returns the user's post with the most comments" do
      expect(@ana.most_commented_post).to eq(@post2)
    end
  end

  describe "number_of_following" do
    it "returns the number of users you're following" do
      expect(@ana.number_of_following).to eq(2)
    end
  end

  describe "number_of_following" do
    it "returns the number of users you're following" do
      expect(@ana.number_of_following).not_to eq(1)
    end
  end

  describe "most_saved_post" do
    it "returns the user's most saved post" do
      expect(@ana.most_saved_post).to eq(@post1)
    end
  end

  describe "most_saved_post" do
    it "returns the user's most saved post" do
      expect(@ana.most_saved_post).not_to eq(@post2)
    end
  end

  describe "most_liked_post" do
    it "returns the user's most liked post" do
      expect(@ana.most_liked_post).to eq(@post1)
    end
  end

  describe "most_liked_post" do
    it "returns the user's most liked post" do
      expect(@ana.most_liked_post).not_to eq(@post2)
    end
  end

end
