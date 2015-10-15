module AccountsHelper
	private
		def account_params
	  		params.require(:account).permit(:username, :profile_picture_url, :table_id, :user_id)
		end	

end
