class Account < ActiveRecord::Base
	belongs_to :table

	validates :username, uniqueness: true


end
