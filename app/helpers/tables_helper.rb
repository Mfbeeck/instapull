module TablesHelper
	private
		def table_params
	  		params.require(:table).permit(:title, :body, :user_id)
		end	

end
