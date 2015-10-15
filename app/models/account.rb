class Account < ActiveRecord::Base
	belongs_to :table

    #if you want to have only one of each account in a table use: validates_uniqueness_of :username, :scope => :table_id
  	validates_presence_of :username

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
			csv << column_names
			all.each do |account|
				csv <<	account.attributes.values_at(*column_names)
			end
		end
	end

    def configInstagram
	    Instagram.configure do |config|

	    end
	end

	def findAccountInfo
		@account = Account.last
		# configInstagram
		apifirstresponse = HTTParty.get("https://api.instagram.com/v1/users/search?q=#{@account.username}&access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}&count=1")
			@account.instagram_id = apifirstresponse['data'][0]['id']
		apisecondresponse = HTTParty.get("https://api.instagram.com/v1/users/#{@account.instagram_id}?access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
			@account.posts = apisecondresponse['data']['counts']['media']
			@account.profile_picture_url = apisecondresponse['data']['profile_picture']
			@account.name = apisecondresponse['data']['full_name']
			@account.followers = apisecondresponse['data']['counts']['followed_by']
			@account.following = apisecondresponse['data']['counts']['follows']
		@account.save
		# dom = Nokogiri::HTML(response.body)
	end

end
