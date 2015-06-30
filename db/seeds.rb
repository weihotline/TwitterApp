require 'faker'

50.times do |i|
  user = User.create(username: Faker::Name.name,
                     email: Faker::Internet.email,
                     password: Faker::Internet.password(8))
  Follow.self_follow(user)
end

300.times do
  Tweet.create(content: Faker::Hacker.say_something_smart,
               author_id: rand(1..50))
end

120.times do
  Follow.create(followee_id: rand(1..50),
                follower_id: rand(1..50))
end
