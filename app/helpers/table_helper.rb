module TableHelper
	private
		def table_params
	  		params.require(:table).permit(:title, :body)
		end	

end
