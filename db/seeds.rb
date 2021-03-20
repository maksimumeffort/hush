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
  username: "Alex"
)

user2 = User.create!(
  email: "user2@user.com",
  password: 123456,
    # name: Faker::Name.name,
  bio: Faker::Quote.jack_handey,
  username: "Tom"
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
  latitude = Faker::Number.between(from: -37.78, to: -37.83).round(4)
  longitude = Faker::Number.between(from: 144.93, to: 145.0).round(5)
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
  latitude = Faker::Number.between(from: -37.78, to: -37.83).round(4)
  longitude = Faker::Number.between(from: 144.93, to: 145.0).round(5)
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

activities_list = [
  {name: "Abseiling", description: "Abseil down a 20 story building"},
  {name: "Specialist cocktails", description: "Drink some of Melbourne's finest cocktails"},
  {name: "Farmer's market", description: "See what you can find"},
  {name: "Play a game", description: "Try your luck in this unique game"},
  {name: "Visit an exhibition", description: "Check out this exhibition"},
  {name: "Photo opportunity", description: "Get your photo taken at this great location"},
  {name: "Amazing coffee!", description: "Experience for yourself why Melbourne is internationally known for its coffee"},
  {name: "Outside dining", description: "Treat yourself to some fine food and wine"},
  {name: "Historical building", description: "This building is older than your great great grandfather"},
  {name: "Best pizza - EVER!", description: "Dont take our word for it, try it yourself!"},
  {name: "Take a cooking class", description: "Who says you can't teach an old dog new tricks"},
  {name: "Go Bowling", description: "Everyone loves a game of bowling"},
  {name: "Grab an ice cream", description: "I scream for ice cream"},
  {name: "Explore the markets", description: "Who knows what you'll find"},
  {name: "Learn about Aboriginal Culture", description: "Spend some time getting to know how aboriginal people live"},
  {name: "Order some street food", description: "Try something you've never tried before"},
  {name: "Enjoy some live music", description: "Have a listen to some of the local artists in the area"}
]

tours_list = [
  {name: "Easy on the wallet tour", description: "The cheapest activities around town"},
  {name: "Melbourne Laneway Secrets", description: "It's actually not creepy at all."},
  {name: "AdvenTour", description: "Well I think the name works ..."},
  {name: "Glenn's Slack Tour", description: "Meme your way around town!"},
  {name: "Coffee Lovers Tour", description: "Explore Melbourne's prime caffeine hotspots"},
  {name: "Manon Manon Manon", description: "It's mostly cocktails ... ok fine ... it's all cocktails"},
  {name: "History Tour", description: "If you like history"},
  {name: "Melbourne Ghost Tour", description: "Last stop - new undies"},
  {name: "Food Lover Tour", description: "Loosen your belts"},
  {name: "Anti-Tourist Hotspots Tour", description: "Hotspots - avoiding the tourists!"},
  {name: "Dude where's my tour?", description: "Retracing my steps from last night .... "},
  {name: "Kathy's NightOwl Tour?", description: "Unbelievable activities to do at 3:30am .... "},
  {name: "Alex's Mystery Tour?", description: "If anyone can take you to 3 places at once - I can :-) "}
  ]

 spare = ["Green escapes", "The Landmark Tour", "City to Sea", "FairyTale Tour", "Pirate Tour", "Alex's Mystery Tour"]

13.times do
# puts "creating 1 user & 1 tour"

  user = User.all.sample
  tour_template = tours_list.sample

   filters = ['History', 'Art', 'Food', 'Music','Outdoor','Family','Grownups','Disabled','Pets','Fitness','Adventure','Fashion', 'Beauty','Animals','Books','Friends','Plants','Farming']

  tour = Tour.new(
    user: user,
    name: tour_template[:name],
    description: tour_template[:description],
    completed: false,
    public: true
    )

    tour.tag_list.add(filters.sample)
    tour.save!

    tours_list.delete(tour_template)

# puts "created 1 user and 1 tour"

  5.times do

# puts "creating 1 activity"

  time = Time.now - (1..5).to_a.sample
    activity = activities_list.sample
  Activity.create!(
    user: user,
    name: activity[:name],
    description: activity[:description],
    requirements: activity[:description],
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

puts "created #{User.count} users, #{Tour.count} duplicated_tours, #{Activity.count} activities, #{TourActivity.count} tour activities."

puts "done creating all fun stuff "


