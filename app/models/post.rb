class Post < ApplicationRecord
	has_many :comments, :dependent => :destroy
	has_and_belongs_to_many :categories

	belongs_to :user

	validates_presence_of  :title, :excerpt, :body
end
