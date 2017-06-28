class Product < ApplicationRecord
	validates :name, presence: true
	validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i, :alert => "Not a valid image file...", multiline: true

	has_many :orders
	has_many :comments

	def self.search(search_term)
  	if Rails.env.development?
  		Product.where("name LIKE ?", "%#{search_term}%")
  	else
  		Product.where("name ilike ?", "%#{search_term}%")
  	end
	end

	def highest_rating_comment
	  comments.rating_desc.first
	end	

	def lowest_rating_comment
	  comments.rating_asc.first
	end		

	def average_rating
	  comments.average(:rating).to_f
	end	
end


