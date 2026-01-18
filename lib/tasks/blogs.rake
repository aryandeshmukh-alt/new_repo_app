namespace :blogs do
  desc "Print published and draft blog count"
  task count: :environment do
    puts "Published blogs: #{Blog.published.count}"
    puts "Draft blogs: #{Blog.drafts.count}"
  end
end
