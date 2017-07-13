require 'rails_helper'

describe Product, type: :model do
  # Context blocks are used to group similar tests together...
  context "when the product has comments" do
  	let(:product) { Product.create!(name: "race bike") }
  	let(:user) { User.create!(email: "test@email.com", password: "testing") }

		before do
		  product.comments.create!(rating: 1, user: user, body: "Awful bike!")
		  product.comments.create!(rating: 3, user: user, body: "Ok bike!")
		  product.comments.create!(rating: 5, user: user, body: "Great bike!")
		end

    # def highest_rating_comment
    #   comments.rating_desc.first
    # end 
    it "shows the comment with the highest rating" do
      expect(product.highest_rating_comment.body).to eq "Great bike!"
    end

    # def lowest_rating_comment
    #   comments.rating_asc.first
    # end   
    it "shows the comment with the lowest rating" do
      expect(product.lowest_rating_comment.body).to eq "Awful bike!"
    end

    # def average_rating
    #   comments.average(:rating).to_f
    # end 
    it "returns the average rating of all comments" do
      # "Expect the product's average rating to equal 3"
      expect(product.average_rating).to eq 3
    end
    
    # validates :name, presence: true
    it "is not valid without a name" do
  		expect(Product.new(description: "Nice bike")).not_to be_valid
  	end
  end

  it "is valid with a name, description, image_url, colour and price" do
    product = FactoryGirl.build(:product)
    expect(product).to be_valid
  end

  # validates_format_of :image_url, :with => %r{\A*\.(png|jpg|jpeg)$\z}i, :alert => "Not a valid image file...", multiline: true, :allow_blank => true
  it "is invalid with extension of image_url other than png|jpg|jpeg" do
    product = FactoryGirl.build(:product, image_url: "blue_test_bike.gif")
    expect(product).not_to be_valid
  end

  # validates :price, numericality: {greater_than_or_equal_to: 0.00}, :allow_blank => true
  it "is invalid with negative price" do
    product = FactoryGirl.build(:product, price: "-1.99")
    expect(product).not_to be_valid
  end

  # def set_latest_reviewer(user_name)
  #   $redis.set("lr_product:#{id}","#{user_name}")
  # end
  # def get_latest_reviewer
  #   $redis.get("lr_product:#{id}") # this returns the user's first name...
  # end
  it "gets value from key lr_product:1" do
    product = FactoryGirl.build(:product)
    product.set_latest_reviewer("Bill")
    expect(product.get_latest_reviewer).to eq "Bill"
  end

  # def viewed
  #   $redis.incr("product:#{id}") # this is equivalent to 'INC product:1'
  # end   
  # def views
  #   $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
  # end
  it "has a value > 0" do
    product = FactoryGirl.build(:product)
    product.viewed                        # increments the number of views...
    expect(product.views.to_i).to be > 0  # which means this can't be zero...
  end

end