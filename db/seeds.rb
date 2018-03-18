require 'faker'

3.times do
  User.create!(
  email: Faker::Internet.email,
  password: "hidden"
  )
end

users = User.all

10.times do
  Topic.create!(
  title: Faker::Book.title,
  user: users.sample
  )
end

topics = Topic.all

20.times do
  Bookmark.create!(
  url: Faker::Internet.url,
  topic: topics.sample
  )
end

bookmarks = Bookmark.all

puts "Seeds Complete"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
