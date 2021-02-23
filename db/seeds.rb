# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "removing all fun"
Location.destroy_all
Activity.destroy_all
TourActivity.destroy_all
Booking.destroy_all
Tour.destroy_all
User.destroy_all
puts "fun successfully removed "

user1 = User.create!(
  email: "user@user.com",
  password: 123456
  # name: Faker::Name.name,
  # description: Faker::Quote.jack_handey,
  # username: Faker::Game.title
)

user2 = User.create!(
  email: "user2@user.com",
  password: 123456
    # name: Faker::Name.name,
  # description: Faker::Quote.jack_handey,
  # username: Faker::Game.title
)

10.times do
  User.create!(
  email: Faker::Internet.email,
  password: 123456
  # name: Faker::Name.name,
  # description: Faker::Quote.jack_handey,
  # username: Faker::Game.title
)

end

puts "done creating all users "

20.times do

  time = Time.now - (1..5).to_a.sample

  Location.create!(
    # user: user1.id,
    user_id: User.all.sample.id,
    latitude: Faker::Number.between(from: 37.0, to: 38.0).round(4),
    longitude: Faker::Number.between(from: 144.0, to: 145.0).round(4),
    address: Faker::Address.full_address,
    opening_time: time,
    closing_time: time + (1..5).to_a.sample)
end

20.times do
  Location.create!(
    # user: user2.id,
    user_id: User.all.sample.id,
    latitude: Faker::Number.between(from: 37.0, to: 38.0).round(4),
    longitude: Faker::Number.between(from: 144.0, to: 145.0).round(4),
    address: Faker::Address.full_address)
end

10.times do
  Tour.create!(
    user: User.all.sample,
    name: Faker::Coffee.blend_name,
    description: Faker::Coffee.notes,
    completed: false
    )

  10.times do

  time = Time.now - (1..5).to_a.sample

  Activity.create!(
    name: Faker::Game.genre,
    description: Faker::Movie.quote,
    requirements: Faker::Movie.quote,
    duration: (1-1440).to_a.sample,
    start_time: time,
    finish_time: time + (1..5).to_a.sample,
    location: Location.all.sample
    )

  TourActivity.create!(
    tour: Tour.last,
    activity: Activity.last,
    completed: false
    )
  end
end

10.times do
  Booking.create!(
    tour: Tour.all.sample,
    user: User.all.sample,
    date: Date.today
    )

end


puts "done creating all fun stuff "

# Inspection.all.each do |ins|
#   if ins.user_id == user1.id
#     Booking.create(
#     status: "Pending",
#     inspection_id: ins.id,
#     user_id: user2.id,
#     note: Faker::Movie.quote,
#     )
#   else
#     Booking.create(
#     status: "Pending",
#     inspection_id: ins.id,
#     user_id: user1.id,
#     note: Faker::Movie.quote,
#     )
#   end
# end
# puts "done creating all seeds "

