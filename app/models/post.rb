class Post < ApplicationRecord
	has_many :comments, :dependent => :destroy
	has_and_belongs_to_many :categories

	belongs_to :user

	validates_presence_of  :title, :excerpt, :body, :permalink
	validates_uniqueness_of :permalink
	validates_inclusion_of :draft, :in => [true, false]  
	validates_associated :user
end
