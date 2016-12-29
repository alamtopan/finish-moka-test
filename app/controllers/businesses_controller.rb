class BusinessesController < ApplicationController
  def index
    collection
  end

  def new
    if current_business.present?
      redirect_to businesses_path, alert: 'You already have a business!'
    else
      @business = Business.new
    end
  end

  def create
    @business = Business.new(params_business)
    if @business.save
      redirect_to business_path(@business), notice: 'Successfully created new business!'
    else
      redirect_to :back, alert: @business.errors.full_messages
    end
  end

  def edit
    resource
  end

  def update
    resource
    if @business.update(params_business)
      redirect_to businesses_path, notice: 'Successfully updated my business!'
    else
      redirect_to :back, alert: @business.errors.full_messages
    end
  end

  def show
    resource
  end

  def destroy
    resource
    if @business.destroy!
      redirect_to businesses_path, notice: 'Successfully deleted my business!'
    else
      redirect_to :back, alert: @business.errors.full_messages
    end
  end

  protected
    def resource
      @business = Business.find(params[:id])
    end

    def collection
      @businesses = Business.latest
    end

    def params_business
      params.require(:business).permit(:id, :name, :address, :city, :user_id, items_attributes: [:id, :business_id, :name, :price, :_destroy])
    end
end
