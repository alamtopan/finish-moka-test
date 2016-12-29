class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  def show
     resource
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to login_path, notice: 'Successfully registered as a user, please log in as user!'
    else
      redirect_to :back, alert: @user.errors.full_messages
    end
  end

  def edit
    resource
  end

  def update
    resource
    if @user.update(params_user)
      redirect_to edit_user_path(@user), notice: 'Successfully updated your profile!'
    else
      redirect_to :back, alert: @user.errors.full_messages
    end
  end

  protected
    def resource
      @user = User.find(params[:id])
    end

    def params_user
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end
end
