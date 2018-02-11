class Category < ApplicationRecord
	has_many_and_belongs_to :posts
	validates_presence_of :name
end
