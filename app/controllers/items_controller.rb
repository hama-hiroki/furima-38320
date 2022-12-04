class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: "DESC")
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
    
  def show
     end
      

  def edit
    if @item.user_id == current_user.id && @item.order.nil?
    else
    redirect_to root_path
   end
    
  end

  def update
     @item.update(item_params)
    if @item.valid?
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
    
      redirect_to root_path
  end


  private

  def item_params
    params.require(:item)
          .permit(:image, :name, :product_description, :category_id, :condition_id,
                  :shipping_charge_id, :shipping_area_id, :estimated_shipping_date_id,
                  :price).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end

  def prevent_url
  if current_user.id == @item.user_id
    redirect_to root_path
  end
  end

end
