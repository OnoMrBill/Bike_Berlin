class Product < ApplicationRecord
	validates :name, presence: true
	validates_format_of :image_url, :with => %r{\A*\.(png|jpg|jpeg)$\z}i, :alert => "Not a valid image file...", multiline: true, :allow_blank => true
	validates :price, numericality: {greater_than_or_equal_to: 0.00}, :allow_blank => true

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

  def views
    $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
  end

  def viewed!
  	logger.debug "BF: inside viewed! method of Product model..."
    $redis.incr("product:#{id}") # this is equivalent to 'INC product:1'
  end	
end


