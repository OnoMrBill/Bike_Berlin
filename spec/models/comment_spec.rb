require 'rails_helper'

describe Comment, type: :model do
  context "body and rating are present" do
    let(:comment) { Comment.create!(body: "Great bike!", rating: 5) }

    it "is not valid without a user" do
      expect(Comment.new(body: "Great bike!", rating: 5)).not_to be_valid
    end
  end

  # These are tested within the product_spec.rb...  
  # scope :rating_desc, -> { order(rating: :desc) }
  # scope :rating_asc, -> { order(rating: :asc) }

  # validates :body, presence: true  
  it "is not valid without a body" do
    comment = FactoryGirl.build(:comment, body: nil) 
    expect(comment).not_to be_valid
  end

  # validates :user, presence: true
  it "is not valid without a user" do
    comment = FactoryGirl.build(:comment, user: nil)
    expect(comment).not_to be_valid
  end

  # validates :product, presence: true
  it "is not valid without a product" do
    comment = FactoryGirl.build(:comment, product: nil)
    expect(comment).not_to be_valid
  end

  # validates :rating, numericality: { only_integer: true }  
  it "is invalid with non-integer value" do
    comment = FactoryGirl.build(:comment, rating: "1.99")
    expect(comment).not_to be_valid
  end

  # verify that the create method creates a valid comment
  it "is valid with a user_id, body, rating and product_id" do
    comment = FactoryGirl.build(:comment)
    expect(comment).to be_valid
  end

end