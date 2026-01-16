Blog.destroy_all
Comment.destroy_all

10.times do |i|
  Blog.create!(
    title: "Published Blog #{i + 1}",
    body: "This is a published blog",
    published: true
  )
end

10.times do |i|
  Blog.create!(
    title: "Draft Blog #{i + 1}",
    body: "This is a draft blog",
    published: false
  )
end

Blog.published.each do |blog|
  2.times do
    blog.comments.create!(body: "Nice article")
  end
end
