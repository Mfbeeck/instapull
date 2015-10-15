class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user 

	def current_user 
		@current_user = User.find(session[:user_id]) if session[:user_id] 
	end

	 def require_logged_in
	 	if current_user
	 	else	
	 		redirect_to login_path
			flash.notice = "Please login to continue!"
		end
	 end

	 def require_table_user
	 	if session[:user_id] != @table.user_id
	      flash[:notice] = "You don't have access to that page!"
	      redirect_to search_home_path
	    end
	 end
end
