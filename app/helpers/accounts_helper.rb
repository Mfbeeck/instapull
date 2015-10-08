module AccountsHelper
	private
		def account_params
	  		params.require(:account).permit(:username)
		end	

end
