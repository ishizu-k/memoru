# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.times do |n|
  user = User.new(
    name: "テストユーザー",
    email: "test@example.com",
    password: "111111",
    password_confirmation: "111111",
    image: ""
  )
  user.save
end

20.times do |m|
  name = Faker::Dessert.variety
  place = Faker::Books::Lovecraft.location
  memo = Faker::Books::Lovecraft.fhtagn
  image = Faker::Avatar.image
  position = Faker::Military.army_rank
  hometown = Faker::Space.planet
  meeting_logs = MeetingLog.new(
    name: name,
    day: "2019-07-28",
    place: place,
    memo: memo,
    how: "peacefully",
    image: image,
    position: position,
    status: "記憶中",
    age: "20",
    look: "",
    birth: "",
    blood: "",
    hometown: hometown,
    other: "",
    # user_id: "1"
  )
  meeting_logs.save
end
