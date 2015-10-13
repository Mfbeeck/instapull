class TableController < ApplicationController
	include TablesHelper

	def index
	  @tables = Table.all.order('created_at DESC')
	end

	def new
		@table = Table.new
	end

	def edit
		@table = Table.find(params[:id])
	end

	def show
		@table = Table.find(params[:id])
	end

	def create
		@table = Table.new(table_params)
		if @table.save
			redirect_to root_path
			flash.notice = "The table \"#{@table.title}\" was successfully created."
		else
			flash.notice = "The table was not successfully created. Please try again."
		end	
	end

	def update
		@table = Table.find(params[:id])
		@table.update(table_params)
		redirect_to table_path(@table)
		flash.notice = "The table \"#{@table.title}\" was successfully updated."
	end

	def destroy
		@table = Table.find(params[:id])
		@table.destroy
		redirect_to root_path
		flash.notice = "The table \"#{@table.title}\" was successfully deleted."
	end

end
