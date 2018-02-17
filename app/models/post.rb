class Post < ApplicationRecord
	has_many :comments, :dependent => :destroy
	has_and_belongs_to_many :categories

	belongs_to :user

	validates_presence_of  :title, :excerpt, :body, :slug
	validates_uniqueness_of :slug
	validates_inclusion_of :draft, :in => [true, false]  
	validates_associated :user

	  scope :published, lambda { 
	    where("draft = ? AND published_at < ?", false, Time.current)
	  }
	  
	  scope :search, lambda { |terms| 
	     where("title LIKE :t OR body LIKE :t", :t => "%#{terms}%")
	  }
	  
	  def to_param
	    "#{id}-#{slug}"
	  end

	protected
	  def generate_slug
	    self.slug = title unless slug.present?
	    self.slug = slug.parameterize
	  end
end
