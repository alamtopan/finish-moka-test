require "rails_helper"

RSpec.describe BusinessesController, type: :controller do
  context "not logged in" do
    it "should redirect to login" do
      get :index
      expect(response).to redirect_to(login_url)
    end
  end

  context "must logged current user" do
    before do
      @user = FactoryGirl.create(:user)
      session[:user_id] = @user.id
    end

    describe "GET #index" do
      it "populates an array of businesses" do
        get :index
        response.should render_template :index
      end
    end

    describe "Get #show" do 
      it "assigns the requested business to @business" do
        business = FactoryGirl.create(:business)
        get :show, id: business
        assigns(:business).should eq(business)
      end

      it "renders the #show view" do
        get :show, id: FactoryGirl.create(:business)
        response.should render_template :show
      end
    end

    describe "GET #new" do
      it "assigns a new business to @business" do
        get :new
      end
    end

    describe "POST create" do
      context "with valid attributes" do
        it "creates a new business" do
          expect{
            post :create, business: FactoryGirl.attributes_for(:business)
          }.to change(Business, :count).by(1)
        end

        it "redirects to the show business self" do
          post :create, business: FactoryGirl.attributes_for(:business)
          response.should redirect_to Business.last
        end
      end
    end

    describe "Get #edit" do 
      it "assigns the requested business to @business" do
        business = FactoryGirl.create(:business)
        get :edit, id: business
        assigns(:business).should eq(business)
      end

      it "renders the #edit view" do
        get :edit, id: FactoryGirl.create(:business)
        response.should render_template :edit
      end
    end

    describe "PUT update" do
      before :each do
        @business = FactoryGirl.create(:business, name: 'Property Sukabumi', address: 'Lembursitu', city: 'Sukabumi', user_id: User.last)
      end

      context "valid attributes" do
        it "located the requested @business" do
          put :update, id: @business, business: FactoryGirl.attributes_for(:business)
          assigns(:business).should eq(@business)
        end

        it "changes @business's attributes" do
          put :update, id: @business,
            business: FactoryGirl.attributes_for(:business, name: 'Property Raya', address: 'Senen', city: 'Jakarta')
          @business.reload
          @business.name.should eq('Property Raya')
          @business.address.should eq('Senen')
          @business.city.should eq('Jakarta')
        end

        it "redirects to updated business" do
          put :update, id: @business, business: FactoryGirl.attributes_for(:business)
          response.should redirect_to businesses_url
        end
      end

    end

    describe "DELETE destroy" do
      before :each do
        @business = FactoryGirl.create(:business)
      end

      it "deletes the business" do
        expect{
          delete :destroy, id: @business
        }.to change(Business, :count).by(-1)
      end

      it "redirects to businesses #index" do
        delete :destroy, id: @business
        response.should redirect_to businesses_url
      end
    end
  end
end








