require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  describe "GET /blogs" do
    let!(:user) do
      User.create!(
        email: "user@example.com",
        password: "password"
      )
    end

    it "returns only published blogs" do
      published = Blog.create!(
        title: "My Published Blog",
        body: "Body",
        published: true,
        user: user
      )

      draft = Blog.create!(
        title: "My Draft Blog",
        body: "Body",
        published: false,
        user: user
      )

      get blogs_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("My Published Blog")
      expect(response.body).not_to include("My Draft Blog")
    end
  end
end
