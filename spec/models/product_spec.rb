require 'rails_helper'

  # create_table "products", force: :cascade do |t|
  #   t.string "name"
  #   t.text "description"
  #   t.string "image_url"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.string "colour"
  #   t.decimal "price"
  # end

describe Product do
  context "when the product has comments" do
  	let(:product) { Product.create!(name: "race bike") }
  	let(:user) { User.create!(email: "test@email.com", password: "testing") }

		before do
		  product.comments.create!(rating: 1, user: user, body: "Awful bike!")
		  product.comments.create!(rating: 3, user: user, body: "Ok bike!")
		  product.comments.create!(rating: 5, user: user, body: "Great bike!")
		end

    it "returns the average rating of all comments" do
      # expect(person.full_name).to eq "John Smith"
      # "Expect the product's average rating to equal 3"
      expect(product.average_rating).to eq 3
    end

    it "is not valid without a name" do
  		expect(Product.new(description: "Nice bike")).not_to be_valid
  	end
  end
end