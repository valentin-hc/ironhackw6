class ProductsController < ApplicationController
	def index
		@user = current_user
		@products = @user.products.all
	end
	def show_all
		@products = Product.all
	end
	def new
		@user = current_user
		@product = Product.new
	end
	def create
		user = current_user
		product = user.products.new(product_params)
		if product.save
			flash["notice"] = "New product '#{product.title}' successfully added"
			redirect_to user_products_path(user)
		else
			flash["errors"] = product.errors.full_messages
			redirect_to new_user_product_path(user)
		end
	end
	def destroy
		product = Product.find_by(id: params[:id])
		product.destroy
		user = current_user
		flash["notice"] = "Product deleted"
		redirect_to user_products_path(user)
	end
	def show
		@product = Product.find_by(id: params[:id])
		@bid = Bid.new
	end



	private
	def product_params
		params.require(:product).permit(:title, :description, :date, :time, :minimum_bid, :picture)
	end
end
