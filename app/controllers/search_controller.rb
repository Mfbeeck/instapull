class SearchController < ApplicationController
	include AccountsHelper

	def home
		@account = Account.new

	end

end
