require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "POST create /signin session" do
    before(:each) do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
    end

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end

    it "should redirect to dashboard" do
      response.should be_success
    end
  end

  describe "DESTROY session/sign out" do
    before :each do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
    end

    it "deletes the session" do
      session.delete(:user_id)
    end

    it "redirects to login url" do
      response.should be_success
    end
  end
end








