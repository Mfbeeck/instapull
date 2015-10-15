class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
		if @user
		# logged in, hooray
			session[:user_id] = nil
			session[:user_id] = @user.id
	 		redirect_to search_home_path, notice: "You are now logged in as #{@user.username}!"
		else
	 		redirect_to new_user_path
			flash.notice = "Your info was not correct. Please try again."
		end 
	end

	def destroy 
	  	session[:user_id] = nil 
	  	redirect_to login_path 
	end

end
