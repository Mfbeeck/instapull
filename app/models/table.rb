class Table < ActiveRecord::Base
	has_many :accounts, :dependent => :delete_all
	belongs_to :user

	# def self.to_csv(options = {})
	#   CSV.generate(options) do |csv|
	# 		csv << column_names
	# 		all.each do |account|
	# 			csv <<	account.attributes.values_at(*column_names)
	# 		end
	# 	end
	# end
end
