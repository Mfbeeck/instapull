class AccountsController < ApplicationController
	include AccountsHelper
	
	def index
		@accounts = Account.all.order('username ASC')
	end
	def show
		@account = Account.find(params[:id])
	end
	def create
		@account = Account.new(account_params)
		@account.instagram_url = "https://instagram.com/"+ @account.username
		if @account.save
			redirect_to account_path(@account)
			flash.notice = "The account \"#{@account.username}\" was successfully created."
		else
			redirect_to accounts_path
			flash.notice = "The account \"#{@account.username}\" already exists."
		end

	end
end
