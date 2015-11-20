class ItemsController < ApplicationController
	def create
		item = Item.new(name: params[:item][:name], quantity: params[:item][:quantity], barbecue_id: params[:barbecue_id])
		if item.save
			redirect_to barbecue_path(params[:barbecue_id])
		else
			redirect_to barbecue_path(params[:barbecue_id])
		end
	end

end
