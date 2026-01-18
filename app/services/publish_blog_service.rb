class PublishBlogService
  def initialize(blog)
    @blog = blog
  end

  def call
    return false if @blog.published?

    @blog.update(published: true)
  end
end
