require 'rails_helper'

describe UsersController, type: :controller do
  # let(:user) { User.create!(email: 'peter2@example.com', password: '1234567890') }
  # let(:user2) { User.create!(email: 'paul2@example.com', password: '0123456789') }
  # @user = FactoryGirl.create(:user)
  

  describe 'GET #show' do
    context 'when a user is logged in' do
      # let(:user) { User.create!(email: "test@email.com", password: "testing") }
      # @user = Factory(:user, :password => "Asd123", :password_confirmation => "Asd123")
      # @user = FactoryGirl.create(:user)

      # FactoryGirl.build(:user) didn't work!  Why?
      let(:user) {FactoryGirl.create(:user)}
      # @user = FactoryGirl.build(:user)
    	before do
    		sign_in user
    	end

      it 'loads correct user details' do
        get :show, params: { id: user.id }
        # get :show, params: @user.id
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end

    # context 'when a user is not logged in' do
    #   # let(:user2) { User.create!(email: "test2@email.com", password: "testing") }
    #   let(:user2) {FactoryGirl.create(:user)}
    #   it 'redirects to login' do
    #     get :show, params: { id: user2.id }
    #     expect(response).to redirect_to(new_user_session_path)
    #   end
    # end
  end

end


