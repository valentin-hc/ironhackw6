# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "_________Destroying all tournaments__________"
Tournament.destroy_all
puts "_________Destroying all players__________"
Player.destroy_all
puts "_________Destroying all registrations_________"
Registration.destroy_all


5.times do |n|
	Tournament.create(name: Faker::Book.title)
end

20.times do |n|
	Player.create(name: Faker::Name.name)
end

40.times do |n| 
	Registration.create(tournament_id: rand(Tournament.first.id..Tournament.last.id), player_id: rand(Player.first.id..Player.last.id))
end





