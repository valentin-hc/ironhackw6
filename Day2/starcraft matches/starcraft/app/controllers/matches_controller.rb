class MatchesController < ApplicationController
	def index
		matches = Match.all
		render json: matches
	end

	def show_factions
		faction = Match.get_by_faction(params[:faction])
		unless faction
			render json: {error: "faction not found"}, status: 400
			return
		end
		render json: faction
	end

	def show_players_matches
		player = Match.get_by_id(params[:player])
		unless player
			render json: {error: "player not found"}, status: 400
			return
		end
		render json: player
	end
end
