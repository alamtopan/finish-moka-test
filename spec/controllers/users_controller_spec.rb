require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "assigns a new user to @user" do
      get :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to the index user" do
        post :create, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to login_url
      end
    end
  end

  describe "Get #edit" do 
    context "must logged current user" do
      before do
        @user = FactoryGirl.create(:user)
        session[:user_id] = @user.id
      end

      it "assigns the requested user to @user" do
        user = FactoryGirl.create(:user)
        get :edit, id: user
        assigns(:user).should eq(user)
      end

      it "renders the #edit view" do
        get :edit, id: FactoryGirl.create(:user)
        response.should render_template :edit
      end
    end
  end

  describe "PUT update" do
    context "must logged current user" do
      before do
        @user = FactoryGirl.create(:user)
        session[:user_id] = @user.id
      end

      before :each do
        @user = FactoryGirl.create(:user, email: 'alam@gmail.com', first_name: 'Alam', last_name: 'Topani', password: '12345678', password_confirmation: '12345678')
      end

      context "valid attributes" do
        it "located the requested @user" do
          put :update, id: @user, user: FactoryGirl.attributes_for(:user)
          assigns(:user).should eq(@user)
        end

        it "changes @user's attributes" do
          put :update, id: @user,
            user: FactoryGirl.attributes_for(:user, email: 'alam@mamorae.com', first_name: 'Alan', last_name: 'Herdian')
          @user.reload
          @user.email.should eq('alam@mamorae.com')
          @user.first_name.should eq('Alan')
          @user.last_name.should eq('Herdian')
        end

        it "redirects to user edit" do
          put :update, id: @user, user: FactoryGirl.attributes_for(:user)
          response.should redirect_to edit_user_url(@user)
        end
      end
    end
  end
end








