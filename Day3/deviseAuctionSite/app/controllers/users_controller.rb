class UsersController < ApplicationController
	skip_before_filter :require_login, :only => :create
	def index
		@user = current_user
		#binding.pry
	end
end
