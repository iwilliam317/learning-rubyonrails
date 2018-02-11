class User < ApplicationRecord
	validates_presence_of :first_name, :last_name, :email
	validates_uniqueness_of :email 

	has_many :posts
	
	def full_name
		"#{first_name} #{last_name}"
	end
end
