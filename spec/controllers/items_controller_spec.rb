require "rails_helper"

RSpec.describe ItemsController, type: :controller do
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

      @business = FactoryGirl.create(:business)
    end

    describe "GET #index" do
      it "populates an array of items" do
        get :index
        response.should render_template :index
      end
    end

    describe "GET #new" do
      it "assigns a new item to @item" do
        get :new
      end
    end

    describe "POST create" do
      context "with valid attributes" do
        it "creates a new item" do
          expect{
            post :create, item: FactoryGirl.attributes_for(:item)
          }.to change(Item, :count).by(1)
        end

        it "redirects to the index business" do
          post :create, item: FactoryGirl.attributes_for(:item)
          response.should redirect_to businesses_url
        end
      end
    end

    describe "Get #edit" do 
      it "assigns the requested item to @item" do
        item = FactoryGirl.create(:item)
        get :edit, id: item
        assigns(:item).should eq(item)
      end

      it "renders the #edit view" do
        get :edit, id: FactoryGirl.create(:item)
        response.should render_template :edit
      end
    end

    describe "PUT update" do
      before :each do
        @item = FactoryGirl.create(:item, name: 'Item Property', price: 10000, business_id: Business.last.id)
      end

      context "valid attributes" do
        it "located the requested @item" do
          put :update, id: @item, item: FactoryGirl.attributes_for(:item)
          assigns(:item).should eq(@item)
        end

        it "changes @item's attributes" do
          put :update, id: @item,
            item: FactoryGirl.attributes_for(:item, name: 'Item Property Raya', price: 20000, business_id: Business.last.id)
          @item.reload
          @item.name.should eq('Item Property Raya')
          @item.price.should eq(20000)
          @item.business_id.should eq(Business.last.id)
        end

        it "redirects to business index" do
          put :update, id: @item, item: FactoryGirl.attributes_for(:item)
          response.should redirect_to businesses_url
        end
      end

    end

    describe "DELETE destroy" do
      before :each do
        @item = FactoryGirl.create(:item)
      end

      it "deletes the item" do
        expect{
          delete :destroy, id: @item
        }.to change(Item, :count).by(-1)
      end

      it "redirects to items #index" do
        delete :destroy, id: @item
        response.should redirect_to items_url
      end
    end
  end
end








