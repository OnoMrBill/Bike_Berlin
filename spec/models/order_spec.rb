require 'rails_helper'

  # create_table "orders", force: :cascade do |t|
  #   t.integer "user_id"
  #   t.integer "product_id"
  #   t.float "total"
  #   t.index ["product_id"], name: "index_orders_on_product_id"
  #   t.index ["user_id"], name: "index_orders_on_user_id"
  # end

describe Order do
  context "user_id and product_id are present" do
  	let(:order) { Order.create!(user_id: 1, product_id: 1) }

    it "is not valid without a name" do
  		expect(Order.new(user_id: nil, product_id: nil)).not_to be_valid
  	end
  end
end