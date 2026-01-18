require 'rails_helper'

RSpec.describe Blog, type: :model do
  let(:user) { User.create!(email: "user@example.com", password: "password") }

  it "is valid with valid attributes" do
    blog = Blog.new(
      title: "Test",
      body: "Body",
      published: true,
      user: user
    )
    expect(blog).to be_valid
  end

  it "is invalid without title" do
    blog = Blog.new(body: "Body", user: user)
    expect(blog).not_to be_valid
  end

  it "is invalid without body" do
    blog = Blog.new(title: "Title", user: user)
    expect(blog).not_to be_valid
  end

  it "returns only published blogs" do
    published = Blog.create!(
      title: "Pub",
      body: "Body",
      published: true,
      user: user
    )

    draft = Blog.create!(
      title: "Draft",
      body: "Body",
      published: false,
      user: user
    )

    expect(Blog.published).to include(published)
    expect(Blog.published).not_to include(draft)
  end
end
