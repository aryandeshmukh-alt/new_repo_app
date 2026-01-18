require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(email: "test@example.com", password: "password") }

  it "is valid for published blog" do
    blog = Blog.create!(
      title: "Test",
      body: "Body",
      published: true,
      user: user
    )

    comment = blog.comments.new(
      body: "Nice post",
      user: user
    )

    expect(comment).to be_valid
  end

  it "is invalid for unpublished blog" do
    blog = Blog.create!(
      title: "Draft",
      body: "Body",
      published: false,
      user: user
    )

    comment = blog.comments.new(
      body: "Nice post",
      user: user
    )

    expect(comment).not_to be_valid
  end

  it "is invalid without body" do
    blog = Blog.create!(
      title: "Test",
      body: "Body",
      published: true,
      user: user
    )

    comment = blog.comments.new(user: user)
    expect(comment).not_to be_valid
  end
end
