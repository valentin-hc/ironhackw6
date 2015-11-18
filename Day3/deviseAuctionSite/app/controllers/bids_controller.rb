class BidsController < ApplicationController
	def create
		product = Product.find_by(id: params[:product_id])
		bid = product.bids.new(amount: params[:bid][:amount], user_id: current_user.id, minimum_bid: product.minimum_bid)
		#binding.pry
		if bid.save
			flash["notice"] = "Bid added !"
			redirect_to product_path(product)
		else
			flash["errors"] = bid.errors.full_messages
			redirect_to product_path(product)
		end
	end
end
