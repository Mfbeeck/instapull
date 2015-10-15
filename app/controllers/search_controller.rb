class SearchController < ApplicationController
	include AccountsHelper
    before_action :require_logged_in
	
	def home
		@account = Account.new
		@tables = Table.where(user_id: current_user.id).order('title ASC')
	end

	def landing

	end

end
