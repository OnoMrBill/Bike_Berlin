require 'rails_helper'

  # context "first and last name present" do
  #   let(:person) { Person.new(first_name: "John", last_name: "Smith") }

  #   it "should return first and last" do
  #     expect(person.full_name).to eq "John Smith"
  #   end
  # end

  # context "first name missing" do
  #   let(:person) { Person.new(last_name: "Smith") }

  #   it "should return last name only" do
  #     expect(person.full_name).to eq "Smith"
  #   end
  # end

  # describe User do
  #   context "email and password are present" do
  #   	let(:user) { User.create!(email: "test@email.com", password: "testing") }

  #     it "is not valid without email and password" do
  #   		expect(User.new(email: nil, password: nil)).not_to be_valid
  #   	end
  #   end
  # end

  describe User, type: :model do
    it "is invalid without an email address" do
      @user = FactoryGirl.build(:user, email: "not_an_email")
      expect(@user).to_not be_valid
    end

    it "rejects an invalid password" do
      @user = FactoryGirl.build(:user, password: "12")
      expect(@user).not_to be_valid
    end

end
