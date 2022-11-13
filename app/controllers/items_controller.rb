class ItemsController < ApplicationController
  def index
    @items = Item.all
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
    params.require(:item)
    .permit(:image, :name, :product_description, :category_id, :condition_id, 
            :shipping_charge_id, :shipping_area_id, :estimated_shipping_date_id,
            :price).merge(user_id: current_user.id)
  end
end
