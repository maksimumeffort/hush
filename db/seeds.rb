# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "removing all fun"
TourActivity.destroy_all
Activity.destroy_all
Location.destroy_all
Tour.destroy_all
User.destroy_all
puts "fun successfully removed "

user1 = User.create!(
  email: "user@user.com",
  password: 123456,
  # name: Faker::Name.name,
  bio: Faker::Quote.jack_handey,
  username: "Test User"
)

user2 = User.create!(
  email: "user2@user.com",
  password: 123456,
    # name: Faker::Name.name,
  bio: Faker::Quote.jack_handey,
  username: Faker::Game.title
)

10.times do
  User.create!(
  email: Faker::Internet.email,
  password: 123456,
  # name: Faker::Name.name,
  bio: Faker::Quote.jack_handey,
  username: Faker::Game.title
)

end

puts "done creating all users "

20.times do

  time = Time.now - (1..5).to_a.sample
  latitude = Faker::Number.between(from: -37.6, to: -37.8).round(4)
  longitude = Faker::Number.between(from: 144.5, to: 145.5).round(4)
  results = Geocoder.search([latitude, longitude])
  address = results.first.address

  Location.create!(
    # user: user1.id,
    user: User.all.sample,
    latitude: latitude,
    longitude: longitude,
    address:  address,
    opening_time: time,
    closing_time: time + (1..5).to_a.sample)
end

20.times do
  latitude = Faker::Number.between(from: -37.6, to: -37.8).round(4)
  longitude = Faker::Number.between(from: 144.5, to: 145.5).round(4)
  results = Geocoder.search([latitude, longitude])
  address = results.first.address

  Location.create!(
    # user: user2.id,
    user: User.all.sample,
    latitude: latitude,
    longitude: longitude,
    address:  address
  )
end

10.times do
# puts "creating 1 user & 1 tour"
  categories = ['History', 'Art', 'Food', 'Music','Outdoor','Family','Grownups','
    Disabled','Pets']

  user = User.all.sample

  Tour.create!(
    user: user,
    name: Faker::Coffee.blend_name,
    description: Faker::Coffee.notes,
    category_list: categories.sample,
    completed: false,
    public: true
    )

# puts "created 1 user and 1 tour"

  5.times do

# puts "creating 1 activity"

  time = Time.now - (1..5).to_a.sample

  Activity.create!(
    user: user,
    name: Faker::Game.genre,
    description: Faker::Movie.quote,
    requirements: Faker::Movie.quote,
    duration: (1..1440).to_a.sample,
    start_time: time,
    finish_time: time + (1..5).to_a.sample,
    location: Location.all.sample
    )

  # puts "creating 1 tour activity"

  TourActivity.create!(
    tour: Tour.last,
    activity: Activity.last,
    completed: false
    )

# puts "created 1 activity and 1 tour activity"
  end

puts "created #{User.count} users, #{Tour.count} tours, #{Activity.count} activities, #{TourActivity.count} tour activities."
end


  Tour.all.each  do |tour|
    tour.clone
end
puts "created #{User.count} users, #{Tour.count} duplicated_tours, #{Activity.count} activities, #{TourActivity.count} tour activities."

puts "done creating all fun stuff "

