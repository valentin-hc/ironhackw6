class BarbecuesController < ApplicationController
  def index
    @barbecues = Barbecue.order(:date)
  end

  def show
    @item = Item.new
    # Don't add any code to this show action.
    # Implement your barbecue API in another action.
  end
  def api_show
    bbq = Barbecue.find_by(id: params[:id])
    # binding.pry
    unless bbq
      render json: {error: "BBQ not found"}, status: 400
      return
    end
    render json: {bbq: bbq, users: bbq.users, items: bbq.items}
  end
  def api_add_users
    bbq = Barbecue.find_by(id: params[:id])
    bbq.users<<(current_user)
    # binding.pry
    unless bbq
      render json: {error: "BBQ not found"}, status: 400
      return
    end
    render json: {success: "You are now part of this BBQ, awesome!!!"}, status: 200
  end

  def new
    @bbq = Barbecue.new
  end

  def create
    bbq_params = params.require(:barbecue).permit(:title, :venue, :date)
    @bbq = Barbecue.new(bbq_params)

    unless @bbq.save
      render(:new)
    else
      redirect_to(barbecues_path)
    end
  end

end
