class Match < ActiveRecord::Base
	belongs_to :winner, :class_name => "Player"
	belongs_to :loser, :class_name => "PLayer"


	def self.get_by_faction(params)
		faction_array = Match.where("winner_faction = :this_faction OR loser_faction = :this_faction", {this_faction: params})
		faction_win_percentage = (Match.where("winner_faction = :this_faction", {this_faction: params})).length.to_f / faction_array.length * 100	
		main_array = []
		stats = {win_rate: "#{faction_win_percentage}%" }
		main_array << stats
		main_array += faction_array
	end

	def self.get_by_id(params)
		player = Match.where("winner_id = :player_id OR loser_id = :player_id", {player_id: params})
		player_win_percentage = (Match.where("winner_id = :player_id", {player_id: params})).length.to_f / player.length * 100
		player_loss_percentage = (Match.where("loser_id = :player_id", {player_id: params})).length.to_f / player.length  * 100
		percentage_string = Match.percentage_by_faction(params, player)
		main_array = []
		stats = {win_rate: "#{player_win_percentage}%",
				 loss_rate: "#{player_loss_percentage}%",
				 win_percentage_by_faction: "#{percentage_string}"}
		main_array << stats
		main_array += player
	end

	def self.percentage_by_faction(params, player)
		factions = ['Zerg', 'Protoss', 'Terrans']
		percentage_string = ""
		factions.each do |faction|
			percentage_with_faction = (Match.where("winner_id = :player_id AND winner_faction = '#{faction}'", {player_id: params})).length.to_f / player.length  * 100
			percentage_string += " #{faction}: #{percentage_with_faction}%,"
		end
		percentage_string
	end

end
