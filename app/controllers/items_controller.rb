class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
   else
    render :new
   end

   
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :item_status_id, :prefecture_id, :category_id, :shipping_cost_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
  
end
