require 'rails_helper'

describe UsersController, type: :controller do

  describe 'GET #show' do
    # context 'when a user is logged in' do
    context 'when a user is logged in' do
      before do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end   
      # example 1
      it "renders the show template" do
        get :show, params: {:id => @user}
        expect(response).to have_http_status(200)
        expect(response).to render_template("show")
      end
      # example 2
      it 'loads correct user details' do
        get :show, params: { id: @user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq @user
      end
    end 
  end

  describe 'GET #show' do
    context 'when a user is not logged in' do
      # example 3
      it "renders the show template" do
        get :show, params: {id: 1}
        expect(response).to have_http_status(200)
        expect(response).to render_template("show")
      end
    end 
  end

  describe 'GET #edit' do
    context 'when admin not logged in' do
      # example 4
      it "should redirect to sign_in page" do
        get :edit, params: {id: 1}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to("/users/sign_in")
      end
    end
  end

end


