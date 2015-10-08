class Account < ActiveRecord::Base

	validates :username, uniqueness: true


end
