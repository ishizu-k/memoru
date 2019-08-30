1.times do |n|
  user = User.create!(
    name: "たなか",
    email: "test@example.com",
    password: "111111",
    password_confirmation: "111111",
    image: ""
  )
  20.times do |m|
    name = Faker::Dessert.variety
    place = Faker::Books::Lovecraft.location
    memo = Faker::Books::Lovecraft.fhtagn
    position = Faker::Military.army_rank
    hometown = Faker::Space.planet
    user.meeting_logs.build(
      name: name +"#{m}",
      day: "2019-07-28",
      place: place,
      memo: memo,
      how: "peacefully",
      image: "",
      position: position,
      status: "memorizing",
      age: "20",
      look: "眼鏡",
      birth: "1999-07-7",
      blood: "unknown",
      hometown: hometown,
      other: "特にない",
    )
    end
  user.save!
end

5.times do |t|
  tag = Tag.new(name: "タグ#{t}")
  tag.save!
end
