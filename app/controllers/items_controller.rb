class ItemsController < ApplicationController

  def index
    collection
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
    if @item.save
      redirect_to businesses_path, notice: 'Successfully created new item!'
    else
      redirect_to :back, alert: @item.errors.full_messages
    end
  end

  def edit
    resource
  end

  def update
    resource
    if @item.update(params_item)
      redirect_to businesses_path, notice: 'Successfully updated my item!'
    else
      redirect_to :back, alert: @item.errors.full_messages
    end
  end

  def destroy
    resource
    if @item.destroy!
      redirect_to items_path, notice: 'Successfully deleted my item!'
    else
      redirect_to :back, alert: @item.errors.full_messages
    end
  end

  protected
    def resource
      @item = Item.find(params[:id])
    end

    def collection
      @items = Item.where(business_id: current_business.id) if current_business.present?
    end

    def params_item
      params.require(:item).permit(:id, :business_id, :name, :price)
    end
end
