# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts("----------------------------")

Match.destroy_all

puts("Destroyed all Matches")
puts("----------------------------")

Player.destroy_all
puts("Destroyed all Players")
puts("----------------------------")

puts("----------------------------")

puts("----------------------------")
puts("Creating Players")

20.times do |x|
	Player.create(name: Faker::Name.name)
	puts("count: #{x+1}")
end

puts("Created Players")
puts("----------------------------")
puts("----------------------------")
puts("----------------------------")
puts("Creating Matches")

factions = ["Terrans", "Zerg", "Protoss"]

(1..15).each do |i|

	winner_faction = rand(0..2)
	loser_faction = winner_faction + 1
	if loser_faction > 2
		loser_faction = 0
	end

	winner_id = rand(Player.first.id..Player.last.id)
	loser_id = rand(Player.first.id..Player.last.id)
	if winner_id == loser_id
		loser_id +=1 
	end

	Match.create(
	date: Faker::Time.between(DateTime.now - 10, DateTime.now),
	duration: rand(1..59),
	winner_faction: factions[winner_faction],
	loser_faction: factions[loser_faction],
	winner_id: winner_id,
	loser_id: loser_id,
	)
end

puts("Created Matches")
puts("----------------------------")
puts("----------------------------")
puts("----------------------------")
