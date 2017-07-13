require 'rails_helper'

describe ProductsController, :type => :controller do
  context 'GET #index' do
    before do
      get :index
    end

    # example 1
    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    # example 2
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  context 'POST #create' do
  	# example 3
    it 'is an invalid product' do
    @product = FactoryGirl.build(:product, name: "")
    expect(@product).not_to be_valid
    end
  end

  context "PUT #update/:price" do
    before do
      @product = FactoryGirl.create(:product, price: "57.99")
      @user = FactoryGirl.build(:admin)
      sign_in @user
    end
    # example 4
    it "successfully updates product price" do
      put :update, params: { :id => @product.id }
      @product.reload
      expect(@product.price).to eq 57.99
    end
  end

  context "PATCH #update/:price" do
    before do
      @product = FactoryGirl.create(:product, name: "Special Bike")
      @user = FactoryGirl.build(:admin)
      sign_in @user
    end
    # example 5
    it "successfully updates product price" do
      patch :update, params: { :id => @product.id }
      @product.reload
      expect(@product.name).to eq "Special Bike"
    end
  end

  context "DELETE #destroy" do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:admin)
      sign_in @user
    end
    # example 6
    it "should allow admin to delete product" do
			delete :destroy, params: {:id => @product}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/products")
    end
  end

  context "GET #new" do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:admin)
      sign_in @user
    end  	
  	# example 7
    it "renders the new template" do
      get :new
      expect(response).to render_template("products/new")
    end
  end  

  context "GET #edit" do
    before do
      @product = FactoryGirl.create(:product, id: 1)
      @user = FactoryGirl.create(:admin)
      sign_in @user
    end  	
  	# example 8
    it "renders the edit template" do
      get :edit, params: { id: 1 }
      expect(response).to render_template("products/edit")
    end
  end   

  context "GET #show" do
    before do
      @product = FactoryGirl.create(:product)
    end  	
  	# example 9
    it "renders the show template" do
      get :show, params: {:id => @product}
      expect(response).to have_http_status(200)
      expect(response).to render_template("show")
    end
  end   

end