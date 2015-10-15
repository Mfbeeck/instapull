class UsersController < ApplicationController
	include UsersHelper
	def new
		@user = User.new 
	end

	def create
	 	@user = User.new(user_params)
	 	if @user.save
	 		session[:user_id] = nil
	 		session[:user_id] = @user.id 
	 		redirect_to search_home_path, notice: "You are now signed up as #{@user.username}!"
	 	else
	 		redirect_to new_user_path
			flash.notice = "Your username has been taken. Please select another."
	 	end
	end
end
