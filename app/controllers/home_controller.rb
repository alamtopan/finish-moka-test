class HomeController < ApplicationController
  def index
    # check if user logged in, if not redirect to login page
    if current_user.present?
      redirect_to businesses_url
    else
      redirect_to login_path
    end
  end

  def signup
    @user = User.new
    # TODO: [MOKA-002] Finish the implementation of User registration
  end
end
