require 'rails_helper'

  # create_table "users", force: :cascade do |t|
  #   t.string "first_name"
  #   t.string "last_name"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.string "email", default: "", null: false
  #   t.string "encrypted_password", default: "", null: false
  #   t.string "reset_password_token"
  #   t.datetime "reset_password_sent_at"
  #   t.datetime "remember_created_at"
  #   t.integer "sign_in_count", default: 0, null: false
  #   t.datetime "current_sign_in_at"
  #   t.datetime "last_sign_in_at"
  #   t.string "current_sign_in_ip"
  #   t.string "last_sign_in_ip"
  #   t.boolean "admin", default: false, null: false
  #   t.index ["email"], name: "index_users_on_email", unique: true
  #   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  # end

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

describe User do
  context "email and password are present" do
  	let(:user) { User.create!(email: "test@email.com", password: "testing") }

    it "is not valid without email and password" do
  		expect(User.new(email: nil, password: nil)).not_to be_valid
  	end
  end
end