class User < ActiveRecord::Base
	has_secure_password
  	has_many :tables, :dependent => :delete_all
    validates :username, uniqueness: true

end
