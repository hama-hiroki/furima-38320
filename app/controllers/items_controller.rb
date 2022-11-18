class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit,:update]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@items.id)
    else
      render :show
    end
  end
    
  def show
    @items = Item.find(params[:id])
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
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

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
  
  def autheniticate_user
    if current_user==nil
      redirect_to("/login")
    end
  end

end
