require 'rails_helper'

  # create_table "comments", force: :cascade do |t|
  #   t.integer "user_id"
  #   t.text "body"
  #   t.integer "rating"
  #   t.integer "product_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["product_id"], name: "index_comments_on_product_id"
  #   t.index ["user_id"], name: "index_comments_on_user_id"
  # end

describe Comment do
  context "body and rating are present" do
  	let(:comment) { Comment.create!(body: "Great bike!", rating: 5) }

    it "is not valid without a user" do
  		expect(Comment.new(body: "Great bike!", rating: 5)).not_to be_valid
  	end
  end
end