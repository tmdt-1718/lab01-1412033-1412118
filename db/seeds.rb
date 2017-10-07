User.delete_all
Article.delete_all
Comment.delete_all
Blog.delete_all
(1..10).each do |user_num|
  user = User.create!(name: Faker::Name.name, email:'hatu87@gmail.com', password: '123')

  (1..10).each do |blog_num|
    blog = user.blog.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10))

    (1..10).each do |comment_count|
      blog.comments.create!(body: Faker::Lorem.paragraph, user_id: user.id)
    end
  end
end
