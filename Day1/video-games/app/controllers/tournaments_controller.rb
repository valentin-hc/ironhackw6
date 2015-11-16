class TournamentsController < ApplicationController
  def index
    render(:index)
  end
  def api_index
  	@tournaments = Tournament.all
  end
  def create
  	tournament = Tournament.create(tournament_params)
  	render json: tournament, status: 201
  end

  def destroy
  	tournament = Tournament.find_by(id: params[:id])
  	unless tournament
  		render json: {error: "tournament not found"}, status: 400
  		return
  	end
  	tournament.destroy
  	render json: tournament, status: 201
  end

  
private
	def tournament_params
		params.require(:tournament).permit(:name)
	end
end
