require 'rails_helper'

RSpec.describe Post do
  before do
    @ana = User.create(name: "Ana")
    @mike = User.create(name: "Mike")
    @post1 = @ana.posts.build(title: "Ana's post", created_at: "2018-11-15 22:15:01", address: "1440 G St NW, Washington, DC 20005")
    @post2 = @mike.posts.build(title: "Mike's post")
    @comment1 = @ana.posts.first.comments.build(content: "Great read!")
    @comment2 = @mike.posts.first.comments.build(content: "Meh")
    @comment3 = @mike.posts.first.comments.build(content: "Waste of time")
  end

  describe "format_time" do
    it "returns the time a post was created in readable format" do
      expect(@post1.format_time).to eq("15 Nov 2018")
    end
  end

  describe "get_address" do
    it "returns the post's address" do
      expect(@post1.get_address).to eq("1440 G St NW, Washington, DC 20005")
    end
  end

end
