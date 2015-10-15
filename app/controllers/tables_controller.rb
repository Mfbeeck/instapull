class TablesController < ApplicationController
	include TablesHelper
 	before_action :require_logged_in
	
	def index
	  	@tables = Table.where(user_id: current_user.id).order('created_at DESC')
	end

	def new
		@table = Table.new
	end

	def edit
		@table = Table.find(params[:id])
		if session[:user_id] != @table.user_id
	      flash[:notice] = "You don't have access to that page!"
	      redirect_to root_path
	    end
	end

	def show
		@table = Table.find(params[:id])
		#prevent users from accesing other user's pages and info
		if session[:user_id] != @table.user_id
	      flash[:notice] = "You don't have access to that page!"
	      redirect_to root_path
	    else
			@accounts = @table.accounts.order('created_at DESC')
			@account = Account.new		
			respond_to do |format|
			    format.html
			    format.csv { render text: @table.accounts.to_csv }
			    format.xls #{ render text: @table.accounts.to_csv(col_sep: "\t") }
			end
		end
	end

	def create
		@table = Table.new(table_params)
		@table.user_id = current_user.id
		if @table.save
			redirect_to table_path(@table)
			flash.notice = "The table \"#{@table.title}\" was successfully created."
		else
			flash.notice = "The table was not successfully created. Please try again."
		end	
	end

	def update
		@table = Table.find(params[:id])
		if session[:user_id] != @table.user_id
	      flash[:notice] = "You don't have access to that page!"
	      redirect_to root_path
	    else
			@table.update(table_params)
			redirect_to table_path(@table)
			flash.notice = "The table \"#{@table.title}\" was successfully updated."
		end
	end

	def destroy
		@table = Table.find(params[:id])
		if session[:user_id] != @table.user_id
	      flash[:notice] = "You don't have access to that page!"
	      redirect_to root_path
	    else
			@table.destroy
			redirect_to tables_path
			flash.notice = "The table \"#{@table.title}\" was successfully deleted."
		end
	end

end
