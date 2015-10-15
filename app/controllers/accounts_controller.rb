class AccountsController < ApplicationController
	include AccountsHelper
    before_action :require_logged_in
	
	def index
		@accounts = Account.where(user_id: current_user.id).order('username ASC')
		respond_to do |format|
		    format.html
		    format.csv { render text: @accounts.to_csv }
		    # format.xls
		end
	end

	def show
		@account = Account.find(params[:id])
		if session[:user_id] != @account.user_id
	      flash[:notice] = "You don't have access to that page!"
	      redirect_to search_home_path
	    end
	end

	def create
		@account = Account.create(account_params)
		@table = Table.find(params[:account][:table_id])
		@account.table_id = @table.id
		@account.user_id = current_user.id
		@account.instagram_url = "https://instagram.com/" + @account.username
		@account.findAccountInfo
		if @account.save
			redirect_to table_path(@table)
			flash.notice = "The account \"\@#{@account.username}\" was successfully added to your \"#{@account.table.title.titleize}\" table."
		else
			redirect_to accounts_path
			flash.notice = "The account \"\@#{@account.username}\" already exists in that table."
		end
	end

	def destroy
		@account = Account.find(params[:id])
		@table = @account.table
		if session[:user_id] != @table.user_id
	      flash[:notice] = "You can't do that!"
	      redirect_to :back
	    else		
			@account.destroy
			redirect_to table_path(@table)
			flash.notice = "The account \"\@#{@account.username}\" was successfully deleted."
		end
	end

end
